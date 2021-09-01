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
    NSAttributedString *feedContent = [self attributeStrWithFeed:_feed];
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
        contentSize.width -= 5;
        
        NSString *userName = [@"@" stringByAppendingFormat:@"%@ ",_feed.originFeed.creator.name];
        NSDictionary *dict = @{NSFontAttributeName : UIFontProvider.systemFont15, NSForegroundColorAttributeName: [UIColor blueColor]};
        NSMutableAttributedString *userNameAtt = [[NSMutableAttributedString alloc] initWithString:userName attributes:dict];
        
        NSMutableAttributedString *forwardFeedContent = [self attributeStrWithFeed:_feed.originFeed];
        [userNameAtt appendAttributedString:forwardFeedContent];
        forwardFeedContent = userNameAtt;
        
        if (_feed.originFeed.imageUrls.count == 0 && _feed.originFeed.videoUrl) {
            NSMutableAttributedString *videoUrlAtt = [[NSMutableAttributedString alloc] initWithString:_feed.originFeed.videoUrl attributes:dict];
            [forwardFeedContent appendAttributedString:videoUrlAtt];
        }
        CGRect forwardFeedContentRect = [forwardFeedContent boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  context:nil];
        CGFloat forwardFeedHeight = ceil(forwardFeedContentRect.size.height);
        self.forwordFeedFrame = CGRectMake(_forwardOffsetX, cellHeight, contentSize.width, forwardFeedHeight);
        cellHeight += forwardFeedHeight;
        _forwardFeedContent = [forwardFeedContent copy];
    }
    self.cellHeight = cellHeight + 60;
}

- (NSMutableAttributedString *)attributeStrWithFeed:(LNFeed *)feed
{
    NSDictionary *dic = @{NSFontAttributeName : UIFontProvider.systemFont15};
    NSMutableAttributedString *feedContent = [[NSMutableAttributedString alloc] initWithString:feed.content attributes:dic];
    
    NSDictionary *topicDict = @{NSFontAttributeName : UIFontProvider.systemFont15, NSForegroundColorAttributeName: [UIColor blueColor]};
    NSString *topicsString = @"";
    for (LNTopic *topic in _feed.topics) {
        topicsString = [topicsString stringByAppendingFormat:@"#%@#", topic.name];
    }
    NSAttributedString *topicsAttributStr = [[NSAttributedString alloc] initWithString:topicsString attributes:topicDict];
    [feedContent appendAttributedString:topicsAttributStr];
    return feedContent;
}

@end
