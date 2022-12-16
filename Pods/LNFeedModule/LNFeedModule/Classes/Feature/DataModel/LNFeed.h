//
//  LNFeed.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LNUser,LNComment,LNTopic;
@interface LNFeed : NSObject

@property(nonatomic, copy)   NSString *feedId;

@property(nonatomic, copy)   NSString *content;

@property(nonatomic, assign) NSInteger likeCount;

@property(nonatomic, assign) NSInteger storeCount;

@property(nonatomic, assign) BOOL isLike;//

@property(nonatomic, assign) BOOL isStored;

@property(nonatomic, assign) NSInteger commentCount;

@property(nonatomic, strong) NSArray *imageUrls;

@property(nonatomic, copy)   NSString *videoUrl;

@property(nonatomic, strong) LNUser *creator;

@property(nonatomic, strong) NSArray <LNComment*> *comments;

@property(nonatomic, strong) NSArray <LNTopic*> *topics;

@property(nonatomic, strong) NSArray <LNUser*> *relatedUsers;

@property(nonatomic, strong) LNFeed *originFeed;

@property(nonatomic, assign) NSTimeInterval createTime;

@end


@interface LNFeed (Operation)

// 点赞
- (void)likeFeedWithCompletion:(void (^)(NSError *error))completion;
// 取消点赞
- (void)unLikeFeedWithCompletion:(void (^)(NSError *error))completion;

// 收藏
- (void)storeFeedCompletion:(void (^)(NSError *error))completion;
// 取消收藏
- (void)unStoreFeedCompletion:(void (^)(NSError *error))completion;

// 评论
- (void)addComment:(LNComment *)comment completion:(void (^)(NSError *error))completion;
// 删除评论
- (void)deleteComment:(LNComment *)comment completion:(void (^)(NSError *error))completion;

// 转发feed
- (void)forwardFeedWithContent:(NSString *)content
                  relatedUsers:(NSArray <LNUser * >*)users
                 relatedTopics:(NSArray <LNTopic * >*)topics
                    completion:(void (^)(NSError *error))completion;


@end

NS_ASSUME_NONNULL_END
