//
//  LNFeedDetailProvider.m
//  FBSnapshotTestCase
//
//  Created by Lenny on 2021/10/17.
//

#import "LNFeedDetailProvider.h"

@implementation LNFeedDetailProvider

- (LNHTTPRequest *)requestWithSuccess:(LNRequestSuccessBlock)success
                              failure:(LNRequestFailureBlock)failure
{
    return [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        
    } succeed:^(id  _Nonnull data) {
        
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

@end
