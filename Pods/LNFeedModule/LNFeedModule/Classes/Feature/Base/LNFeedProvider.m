//
//  LNFeedProvider.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNFeedProvider.h"
#import "LNComment.h"
@implementation LNFeedProvider

// 点赞 或 取消点赞
- (void)feed:(LNFeed *)feed
        like:(BOOL)isLike
  completion:(LNLoadFailureBlock)completion{
    if (isLike) {
        feed.likeCount += 1;
    }else{
        feed.likeCount -= 1;
    }
    feed.isLike = isLike;
    LNSafeBlockCall(completion, @"成功");
    
    [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        if (isLike) {
            request.urlPath = @"feed/unlike";
        }else{
            request.urlPath = @"feed/like";
        }
        request.methodType = LNHTTPMethodTypePost;
    } succeed:^(id  _Nonnull data) {
        LNSafeBlockCall(completion, @"成功");
    } failed:^(NSError * _Nonnull error) {
        LNSafeBlockCall(completion, @"失败");
    }];
}

// 收藏 或 取消收藏
- (void)feed:(LNFeed *)feed
       store:(BOOL)isStore
  completion:(LNLoadFailureBlock)completion{
    
    if (isStore) {
        feed.storeCount += 1;
    }else{
        feed.storeCount -= 1;
    }
    feed.isStored = isStore;
    LNSafeBlockCall(completion, @"成功");
    [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        if (isStore) {
            request.urlPath = @"feed/cancelStore";
        }else{
            request.urlPath = @"feed/store";
        }
        request.methodType = LNHTTPMethodTypePost;
    } succeed:^(id  _Nonnull data) {
        LNSafeBlockCall(completion, @"成功");
    } failed:^(NSError * _Nonnull error) {
        LNSafeBlockCall(completion, @"失败");
    }];
}

// 评论
- (void)addComment:(LNComment *)comment
            toFeed:(LNFeed *)feed
        completion:(LNLoadFailureBlock)completion{
    NSMutableArray *comments = [NSMutableArray array];
    if (feed.comments) {
        [comments addObjectsFromArray:feed.comments];
    }
    if (comment) {
        [comments addObject:comment];
    }
    feed.comments = [comments copy];
    LNSafeBlockCall(completion, @"成功");
    [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.urlPath = @"feed/addComment";
        request.methodType = LNHTTPMethodTypePost;
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:comment.content forKey:@"comment"];
            [params setObject:feed.feedId forKey:@"feedId"];
        }];
    } succeed:^(id  _Nonnull data) {
        LNSafeBlockCall(completion, @"成功");
    } failed:^(NSError * _Nonnull error) {
        LNSafeBlockCall(completion, @"失败");
    }];
}

// 删除评论
- (void)deleteComment:(LNComment *)comment
             fromFeed:(LNFeed *)feed
           completion:(LNLoadFailureBlock)completion{
    
    NSMutableArray *comments = [NSMutableArray arrayWithArray:feed.comments];
    if (comments.count > 0) {
        for (NSInteger index = 0; index < feed.comments.count; index++) {
            LNComment *item = feed.comments[index];
            if ([item.commentId isEqualToString:comment.commentId]) {
                [comments removeObjectAtIndex:index];
                break;
            }
        }
    }
    feed.comments = [comments copy];
    LNSafeBlockCall(completion, @"成功");
    [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.urlPath = @"feed/deleteComment";
        request.methodType = LNHTTPMethodTypeDelete;
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:comment.commentId forKey:@"commentId"];
            [params setObject:feed.feedId forKey:@"feedId"];
        }];
    } succeed:^(id  _Nonnull data) {
        LNSafeBlockCall(completion, @"成功");
    } failed:^(NSError * _Nonnull error) {
        LNSafeBlockCall(completion, @"失败");
    }];
}

// 转发feed
- (void)forwardFeed:(LNFeed *)feed
            content:(NSString *)content
       relatedUsers:(NSArray <LNUser * >*)users
      relatedTopics:(NSArray <LNTopic * >*)topics
         completion:(LNLoadFailureBlock)completion{
    LNFeed *newFeed = [[LNFeed alloc] init];
    newFeed.feedId = @"234376823486";
    feed.content = content;
    feed.originFeed = feed;
    feed.relatedUsers = users;
    feed.topics = topics;
    LNSafeBlockCall(completion, @"成功");
    
    [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.urlPath = @"feed/forwardFeed";
        request.methodType = LNHTTPMethodTypePost;
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:content forKey:@"content"];
            [params setObject:feed.feedId forKey:@"feedId"];
        }];
    } succeed:^(id  _Nonnull data) {
        LNSafeBlockCall(completion, @"成功");
    } failed:^(NSError * _Nonnull error) {
        LNSafeBlockCall(completion, @"失败");
    }];
}

@end
