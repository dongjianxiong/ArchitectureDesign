//
//  LNFeedMediator.m
//  LNFeed
//
//  Created by Lenny on 2021/10/22.
//

#import "LNFeedMediator.h"
#import <LNCommonKit/LNRouter.h>

#import "LNTopicFeedTableViewController.h"
#import "LNFeedDetailViewController.h"
#import "LNFeedRecommendListController.h"
#import "LNFeedTimeLineViewController.h"
#import "LNFeedDetailViewController.h"
#import "LNFeedMainViewController.h"
#import "LNTopicFeedTableViewController.h"
#import "LNFeedComentViewController.h"
#import "LNFeedLikeTableViewController.h"

@interface LNFeedMediator ()

@end

@implementation LNFeedMediator


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIViewController *)createFeedMainVC {
    LNFeedMainViewController *userVC = [[LNFeedMainViewController alloc] initWithNibName:@"LNFeedMainViewController" bundle:[LNFeedModelConfig feedBundle]];
    return userVC;
}

- (UIViewController *)createFeedRecommendVC {
    LNFeedRecommendListController *vc = [[LNFeedRecommendListController alloc] init];
    return vc;
}

- (UIViewController *)createFeedTimeLineVC {
    LNFeedTimeLineViewController*feedVc = [[LNFeedTimeLineViewController alloc] init];
    return feedVc;
}

- (UIViewController *)createFeedFocusVC {
    LNFeedTimeLineViewController*feedVc = [[LNFeedTimeLineViewController alloc] init];
    return feedVc;
}

- (UIViewController *)createUserCenterVCWithUser:(LNUser *)user {
    LNFeedDetailViewController *userVC = [[LNFeedDetailViewController alloc] init];
    return userVC;
}

- (UIViewController *)createFeedDetailVCWithFeed:(LNFeed *)feed {
    LNFeedDetailViewController *feedVc = [[LNFeedDetailViewController alloc] init];
    feedVc.feed = feed;
    return feedVc;
}

/**
 * 创建Feed详情页
 */
- (UIViewController *)createFeedDetailVCWithFeedId:(NSString *)feedId
{
    LNFeedDetailViewController *feedVc = [[LNFeedDetailViewController alloc] init];
    LNFeed *feed = [[LNFeed alloc] init];
    feed.feedId = feedId;
    feedVc.feed = feed;
    return feedVc;
}

- (UIViewController *)createTopicFeedListVCWithTopic:(LNTopic *)topic {
    LNTopicFeedTableViewController *topicFeedVc = [[LNTopicFeedTableViewController alloc] init];
    topicFeedVc.topic = topic;
    return topicFeedVc;
}

- (UIViewController *)createTopicVC {
    LNTopicFeedTableViewController *topicVc = [[LNTopicFeedTableViewController alloc] init];
    return topicVc;
}


- (UIViewController *)createTopicTableVCWithFeed:(LNFeed *)feed
{
    LNTopicFeedTableViewController *topicVc = [[LNTopicFeedTableViewController alloc] init];
    return topicVc;
}

- (UIViewController *)createCommentVCWithFeed:(LNFeed *)feed {
    LNFeedComentViewController *commentVc = [[LNFeedComentViewController alloc] init];
    return commentVc;
}

- (UIViewController *)createLikeTableVC {
    LNFeedLikeTableViewController *likeVc = [[LNFeedLikeTableViewController alloc] init];
    return likeVc;
}


@end
