//
//  LNFeedCellLayout.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNFeedCellLayout.h"
#import "LNCusomUIKitHelper.h"
#import "LNTopic.h"
#import "LNUser.h"

CGFloat const LNFeedCellCententOffsetX = 20;

@implementation LNFeedCellLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.marginY = 5;
        self.commonMarginX = 15;
        self.forwardOffsetX = 20;
        self.imageSpace = 5;
    }
    return self;
}

- (void)setFeed:(LNFeed *)feed
{
    _feed = feed;
    
    CGFloat cellHeight = _marginY + 60;
    
    // 参数1: 自适应尺寸,提供一个宽度,去自适应高度
    // 参数2:自适应设置 (以行为矩形区域自适应,以字体字形自适应)
    // 参数3:文字属性,通常这里面需要知道是字体大小
    // 参数4:绘制文本上下文,做底层排版时使用,填nil即可
    
     //上面方法在计算文字高度的时候可能得到的是带小数的值,如果用来做视图尺寸的适应的话,需要使用更大一点的整数值.取整的方法使用ceil函数
    
    CGFloat maxWidth = LNUIScreenWidth;
    CGFloat contentWidth = maxWidth - 2 * _commonMarginX;
    CGSize contentSize = CGSizeMake(contentWidth, MAXFLOAT);

    // feed的文本高度
    NSAttributedString *feedContent = [self attributeStrWithFeed:_feed isForward:NO];
    CGRect feedContentRect = [feedContent boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  context:nil];
    _feedContent = [feedContent copy];

    CGFloat contentHeight = ceil(feedContentRect.size.height);
    self.contentFrame = CGRectMake(_commonMarginX, cellHeight, contentWidth, contentHeight);
    cellHeight += contentHeight;
    
    //计算图片高度
    CGFloat imageViewHeight = 0;
    if (_feed.imageUrls.count > 0) {
        if (_feed.imageUrls.count > 0 && _feed.imageUrls.count <= 3) {
            imageViewHeight = (contentWidth - 2*_imageSpace) / 3 + _imageSpace;
        }else if(_feed.imageUrls.count > 3 && _feed.imageUrls.count <= 6){
            imageViewHeight = 2* (contentWidth - 2*_imageSpace) / 3 + 2*_imageSpace;
        }else if(_feed.imageUrls.count > 6 && _feed.imageUrls.count <= 9){
            imageViewHeight = 3* (contentWidth - 2*_imageSpace) / 3 + 3*_imageSpace;
        }
    }else if(feed.videoUrl){
        imageViewHeight = 2* (contentWidth - 2*_imageSpace) / 3 + 2*_imageSpace;
    }
   
    self.imageCollectFrame = CGRectMake(_commonMarginX, cellHeight + _imageSpace, contentWidth, imageViewHeight);
    cellHeight += imageViewHeight + _imageSpace;
    
    // 转发Feed文本高度
    if (_feed.originFeed) {
        
        CGSize contentSize = CGSizeMake(contentWidth - 5, MAXFLOAT);
        NSMutableAttributedString *forwardFeedContent = [self attributeStrWithFeed:_feed.originFeed isForward:YES];
        CGRect forwardFeedContentRect = [forwardFeedContent boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  context:nil];
        CGFloat forwardFeedHeight = ceil(forwardFeedContentRect.size.height);
        self.forwordFeedFrame = CGRectMake(_forwardOffsetX, cellHeight, contentSize.width, forwardFeedHeight);
        cellHeight += forwardFeedHeight;
        _forwardFeedContent = [forwardFeedContent copy];
        [self findAllLinkStrWithString:_forwardFeedContent.string];
    }
    self.cellHeight = cellHeight + 60;
}

- (NSMutableAttributedString *)attributeStrWithFeed:(LNFeed *)feed isForward:(BOOL)isForward
{
    NSMutableAttributedString *contentAtt = [[NSMutableAttributedString alloc] init];
    NSDictionary *commonDict = @{NSFontAttributeName : UIFontProvider.systemFont15};
    NSDictionary *highLightdict = @{NSFontAttributeName : UIFontProvider.systemFont15, NSForegroundColorAttributeName: [UIColor blueColor]};
    if (isForward) {
        NSAttributedString *preStrAtt = [[NSAttributedString alloc] initWithString:@"转发自" attributes:commonDict];
        [contentAtt appendAttributedString:preStrAtt];
        NSString *userName = [@"@" stringByAppendingFormat:@"%@ ",feed.creator.name];
        NSAttributedString *userNameAtt = [[NSAttributedString alloc] initWithString:userName attributes:commonDict];
        [contentAtt appendAttributedString:userNameAtt];
        [contentAtt addAttribute:NSLinkAttributeName value:[NSString stringWithFormat:@"user://%@",feed.creator.userId] range:[contentAtt.string rangeOfString:userName]];
    
        [contentAtt addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[contentAtt.string rangeOfString:userName]];
    }
    NSAttributedString *feedContent = [[NSAttributedString alloc] initWithString:feed.content attributes:commonDict];
    [contentAtt appendAttributedString:feedContent];

    for (LNTopic *topic in feed.topics) {
        NSString *topicName = [NSString stringWithFormat:@"#%@#", topic.name];
        NSAttributedString *topicAtt = [[NSAttributedString alloc] initWithString:topicName attributes:highLightdict];
        [contentAtt appendAttributedString:topicAtt];
        [contentAtt addAttribute:NSLinkAttributeName value:[NSString stringWithFormat:@"topic://%@",topic.topicId] range:[contentAtt.string rangeOfString:topicName]];
    }
    if (isForward && feed.videoUrl) {
        NSMutableAttributedString *videoUrlAtt = [[NSMutableAttributedString alloc] initWithString:feed.videoUrl attributes:highLightdict];
        [contentAtt appendAttributedString:videoUrlAtt];
        [contentAtt addAttribute:NSLinkAttributeName value:feed.videoUrl range:[contentAtt.string rangeOfString:videoUrlAtt.string]];
    }

    return contentAtt;
}

- (void)findAllLinkStrWithString:(NSString *)string
{
    for (NSString *regex in [self regexs]) {
        NSError *error;
        NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
        if (!error) {
            NSTextCheckingResult *match = [regular firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
            if (match) {
                NSString *result = [string substringWithRange:match.range];
//                NSLog(@"%@",result);
            }
        }else{
//            NSLog(@"error -- %@",error);
        }
    }
}

- (NSArray *)regexs
{
    return @[@"#.*?#",//话题##
             @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?",//url
             @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}",//邮箱
             @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$",//电话
             @"@.*?(?= ) "
    ];
}


@end
