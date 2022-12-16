//
//  LNFeedCellLayout.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNFeedCellLayout.h"
#import "LNUIKitHelper.h"
#import "LNTopic.h"
#import "LNUser.h"

CGFloat const LNFeedCellContentOffsetX = 20;

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
    
    CGFloat maxWidth = [UIScreen width];
    CGFloat contentWidth = maxWidth - 2 * _commonMarginX; //内容宽度
    CGSize contentSize = CGSizeMake(contentWidth, MAXFLOAT);
    // 创建富文本
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
        self.forwardFeedFrame = CGRectMake(_forwardOffsetX, cellHeight, contentSize.width, forwardFeedHeight);
        cellHeight += forwardFeedHeight;
        _forwardFeedContent = [forwardFeedContent copy];
//        [self findAllLinkStrWithString:_forwardFeedContent.string];
    }
    
    self.createTimeFrame = CGRectMake([UIScreen width]/2 - _commonMarginX, cellHeight, [UIScreen width]/2, 30);
    cellHeight += 30;
    self.createTimeStr = [self timeformatFromSeconds:_feed.createTime];
    self.cellHeight = cellHeight + 60;
}

- (NSMutableAttributedString *)attributeStrWithFeed:(LNFeed *)feed isForward:(BOOL)isForward
{
    NSMutableAttributedString *contentAtt = [[NSMutableAttributedString alloc] init];
    NSDictionary *commonDict = @{NSFontAttributeName : [UIFont systemFontOfSize17]};
    NSDictionary *highLightdict = @{NSFontAttributeName : [UIFont systemFontOfSize17], NSForegroundColorAttributeName: [UIColor blueColor]};
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

//- (void)findAllLinkStrWithString:(NSString *)string
//{
//    for (NSString *regex in [self regexs]) {
//        NSError *error;
//        NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
//        if (!error) {
//            NSTextCheckingResult *match = [regular firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
//            if (match) {
//                NSString *result = [string substringWithRange:match.range];
////                NSLog(@"%@",result);
//            }
//        }else{
//            NSLog(@"error -- %@",error);
//        }
//    }
//}

- (NSArray *)regexs
{
    return @[@"#.*?#",//话题##
             @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?",//url
             @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}",//邮箱
             @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$",//电话
             @"@.*?(?= ) "// @名字
    ];
}

static NSDateFormatter *LNCNYMdHmsformatter = nil;

- (NSString *)timeformatFromSeconds:(NSTimeInterval)seconds
{
//    if (!LNCNYMdHmsformatter) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//        LNCNYMdHmsformatter = formatter;
//    }
    //时间戳转时间的方法
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}


@end
