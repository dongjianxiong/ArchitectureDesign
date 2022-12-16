//
//  LNFeed.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNFeed.h"
#import "LNUser.h"
#import "LNComment.h"
#import "LNTopic.h"

@implementation LNFeed

@end


@implementation LNFeed (Operation)

// 点赞
- (void)likeFeedWithCompletion:(void (^)(NSError *error))completion
{
    
}

// 取消点赞
- (void)unLikeFeedWithCompletion:(void (^)(NSError *error))completion
{
    
}

// 收藏
- (void)storeFeedCompletion:(void (^)(NSError *error))completion
{
    
}

// 取消收藏
- (void)unStoreFeedCompletion:(void (^)(NSError *error))completion
{
    
}

// 评论
- (void)addComment:(LNComment *)comment completion:(void (^)(NSError *error))completion
{
    
}

// 删除评论
- (void)deleteComment:(LNComment *)comment completion:(void (^)(NSError *error))completion
{
    
}

// 转发feed
- (void)forwardFeedWithContent:(NSString *)content
                  relatedUsers:(NSArray <LNUser * >*)users
                 relatedTopics:(NSArray <LNTopic * >*)topics
                    completion:(void (^)(NSError *error))completion
{
    
}

@end
