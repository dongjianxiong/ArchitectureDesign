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

@property(nonatomic, copy)   NSString *createTime;

@property(nonatomic, assign) NSInteger likeCount;

@property(nonatomic, assign) NSInteger storeCount;

@property(nonatomic, assign) NSInteger commentCount;

@property(nonatomic, strong) NSArray *imageUrls;

@property(nonatomic, copy)   NSString *videoUrl;

@property(nonatomic, strong) LNUser *creator;

@property(nonatomic, strong) NSArray <LNComment*> *comments;

@property(nonatomic, strong) NSArray <LNTopic*> *topics;

@property(nonatomic, strong) LNFeed *originFeed;

@end


@interface LNFeed (Operation)

- (void)updateLikeCount:(BOOL)isAdd completion:(void (^)(NSError *error))completion;

- (void)updateStoreCount:(BOOL)isAdd completion:(void (^)(NSError *error))completion;

- (void)addComment:(LNComment *)comment completion:(void (^)(NSError *error))completion;

- (void)deleteComment:(LNComment *)comment completion:(void (^)(NSError *error))completion;

- (void)forwordFeedWithContent:(NSString *)content completion:(void (^)(NSError *error))completion;


@end

NS_ASSUME_NONNULL_END
