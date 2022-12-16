//
//  LNFeedProvider.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNBaseDataProvider.h"
#import "LNFeed.h"
NS_ASSUME_NONNULL_BEGIN

@interface LNFeedProvider : LNBaseDataProvider

// 点赞 或 取消点赞
- (void)feed:(LNFeed *)feed
        like:(BOOL)isLike
  completion:(LNLoadFailureBlock)completion;

// 收藏 或 取消收藏
- (void)feed:(LNFeed *)feed
       store:(BOOL)isStore
  completion:(LNLoadFailureBlock)completion;

// 评论
- (void)addComment:(LNComment *)comment
            toFeed:(LNFeed *)feed
        completion:(LNLoadFailureBlock)completion;

// 删除评论
- (void)deleteComment:(LNComment *)comment
             fromFeed:(LNFeed *)feed
           completion:(LNLoadFailureBlock)completion;

// 转发feed
- (void)forwardFeed:(LNFeed *)feed
            content:(NSString *)content
       relatedUsers:(NSArray <LNUser * >*)users
      relatedTopics:(NSArray <LNTopic * >*)topics
         completion:(LNLoadFailureBlock)completion;

@end

NS_ASSUME_NONNULL_END
