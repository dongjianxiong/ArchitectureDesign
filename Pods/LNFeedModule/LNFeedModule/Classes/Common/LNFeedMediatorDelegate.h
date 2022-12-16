//
//  LNFeedMediatorDelegate.h
//  LNFeed
//
//  Created by Lenny on 2021/10/22.
//

#import <Foundation/Foundation.h>

@class LNFeed, LNTopic, LNUser;

// @warning VC或Vc表示的是ViewController
// 实现类 Mediator/LNFeedMediator
@protocol LNFeedMediatorDelegate <NSObject>

//- (void)showFeedDetailVcWithFeed:(LNFeed *)feed;
//
//- (void)showTopicFeedListVcWithTopic:(LNTopic *)topic;
//
//- (void)showUserCenterVcWithUser:(LNUser *)user;
//
//- (void)showTopicVc;

/*创建ViewController*/

- (UIViewController *)createFeedMainVC;

- (UIViewController *)createFeedRecommendVC;

- (UIViewController *)createFeedTimeLineVC;

- (UIViewController *)createFeedFocusVC;

- (UIViewController *)createTopicFeedListVCWithTopic:(LNTopic *)topic;

- (UIViewController *)createUserCenterVCWithUser:(LNUser *)user;

- (UIViewController *)createFeedDetailVCWithFeed:(LNFeed *)feed;

- (UIViewController *)createFeedDetailVCWithFeedId:(NSString *)feedId;

- (UIViewController *)createTopicVC;

- (UIViewController *)createTopicTableVCWithFeed:(LNFeed *)feed;

- (UIViewController *)createCommentVCWithFeed:(LNFeed *)feed;

- (UIViewController *)createLikeTableVC;


@end
