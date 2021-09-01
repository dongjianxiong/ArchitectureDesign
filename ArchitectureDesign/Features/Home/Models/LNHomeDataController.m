//
//  LNHomeDataController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNHomeDataController.h"
#import "LNFeed.h"
#import "LNUser.h"
#import "LNComment.h"
#import "LNTopic.h"
#import "LNFeedCellLayout.h"

@implementation LNHomeDataController

- (void)requestWithCompletion:(LNListRequestCompletion)completion
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *dataList = [NSMutableArray array];
        for (NSInteger index = 0; index < self.pageSize; index++) {
            LNFeed *feed = [[LNFeed alloc] init];
            feed.likeCount = index * 10;
            feed.commentCount = index + 1;
            feed.storeCount = index * 5;
            feed.content = @"这是一条feed。包含图片文字等内容。你要喜欢可以点赞，也可以收藏，当然也可以评论，甚至可以转发。你要不喜欢可以浏览下一条内容，或者搜索你感兴趣的内容，或者直接根据话题过滤内容，或者你也可以发表自己的Feed，分享生活的点点滴滴";
            
            NSArray *imageUrls = @[@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1309%2F25%2Fc49%2F26316176_26316176_1380092693834_mthumb.jpg&refer=http%3A%2F%2Fimg.pconline.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=ac13f7efea9b80789cd113d4321f77e3",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1501%2F04%2Fc4%2F1470032_1420372871085_mthumb.jpg&refer=http%3A%2F%2Fimg.pconline.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=2bfa721e99a281319d4f4a153f365d86",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcar0.autoimg.cn%2Fupload%2F2013%2F2%2F18%2Fu_20130218165304639264.jpg&refer=http%3A%2F%2Fcar0.autoimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=6a21e822d11cff5c110e27ef8965755d",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic27.nipic.com%2F20130307%2F8984340_113532918000_2.jpg&refer=http%3A%2F%2Fpic27.nipic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=0e8ec9467b4ab6f991d285937d34ed74",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fa0.att.hudong.com%2F61%2F50%2F19300001236771131415509562158_950.jpg&refer=http%3A%2F%2Fa0.att.hudong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=f1d762ff44aad28f21186ead7fd7dc93",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201312%2F16%2F20131216060731_SwtWy.thumb.700_0.gif&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=ff6951b39f6bcb94ec553f9a9509a400",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic27.nipic.com%2F20130307%2F8984340_113532918000_2.jpg&refer=http%3A%2F%2Fpic27.nipic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1633075596&t=d2722ca69cb395efaa170595cb3ff84b",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201312%2F16%2F20131216060731_SwtWy.thumb.700_0.gif&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=ff6951b39f6bcb94ec553f9a9509a400",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi04.c.aliimg.com%2Fimg%2Fibank%2F2013%2F211%2F016%2F791610112_758613609.jpg&refer=http%3A%2F%2Fi04.c.aliimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1633075596&t=2ecd514810c8ec0ac462288767225a6e"];
            NSInteger imageCount = index % 10;
            if (imageCount == 4) {
                feed.videoUrl = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201312%2F16%2F20131216060731_SwtWy.thumb.700_0.gif&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=ff6951b39f6bcb94ec553f9a9509a400";
            }else{
                feed.imageUrls = [imageUrls subarrayWithRange:NSMakeRange(0, imageCount)];
            }
            
            LNUser *user = [[LNUser alloc] init];
            user.name = [NSString stringWithFormat:@"名字%@",@(index)];
            user.userId = [NSString stringWithFormat:@"%@", @(index)];
            user.portraitUrl = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201312%2F16%2F20131216060731_SwtWy.thumb.700_0.gif&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1632927148&t=ff6951b39f6bcb94ec553f9a9509a400";
            feed.creator = user;
            
            NSMutableArray *topics = [[NSMutableArray alloc] init];
            for (NSInteger i = 0; i < index%5; i++) {
                LNTopic *topic = [[LNTopic alloc] init];
                topic.topicId = [NSString stringWithFormat:@"%@-%@", @(index),@(i)];
                topic.name = [NSString stringWithFormat:@"这是一个很好的话题%@", topic.topicId];
                [topics addObject:topic];
            }
            feed.topics = [topics copy];
            
            NSMutableArray *comments = [[NSMutableArray alloc] init];
            for (NSInteger i = 0; i < index; i++) {
                LNComment *comment = [[LNComment alloc] init];
                comment.commentId = [NSString stringWithFormat:@"%@-%@", @(index),@(i)];
                comment.content = [NSString stringWithFormat:@"内容写得不错啊%@", comment.commentId];
                [comments addObject:comment];
            }
            feed.comments = [comments copy];
            
            if (index%2 == 0) {
                feed.content = [feed.content stringByAppendingString:feed.content];
            }else{
                feed.originFeed = feed;
            }
            
            LNFeedCellLayout *feedLayout = [[LNFeedCellLayout alloc] init];
            feedLayout.feed = feed;
            [dataList addObject:feedLayout];
            
        }
        if (completion) {
            completion([dataList copy], nil);
        }
    });
}

@end
