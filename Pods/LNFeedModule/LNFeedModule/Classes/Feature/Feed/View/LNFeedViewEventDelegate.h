//
//  LNFeedViewEventDelegate.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LNFeed, LNTopic, LNUser;
@protocol LNFeedViewEventDelegate <NSObject>

- (void)feedView:(UIView *)view
 clickOnLikeFeed:(LNFeed *)feed
          isLike:(BOOL)isLike;

- (void)feedView:(UIView *)view
clickOnStoreFeed:(LNFeed *)feed
         isStore:(BOOL)isStore;

- (void)feedView:(UIView *)view clickOnCommentFeed:(LNFeed *)feed;

- (void)feedView:(UIView *)view clickOnTopic:(LNTopic *)topic;

- (void)feedView:(UIView *)view clickOnUser:(LNUser *)user;

@end

NS_ASSUME_NONNULL_END
