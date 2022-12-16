//
//  LNTopicListDataSource.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNTopicListDataSource.h"
#import "LNTopic.h"
#import "LNFeedNetworkConst.h"


@implementation LNTopicListDataSource

- (LNHTTPRequest *)requestWithSuccess:(LNRequestSuccessBlock)success
                              failure:(LNRequestFailureBlock)failure{
    
    LNHTTPRequest *request = [LNNetworkManager startRequestCreator:^(LNHTTPRequest *  _Nonnull request) {
        request.urlPath = LNFeedTopicsPath;
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:@(self.pageSize) forKey:@"pageSize"];
            [params setObject:@(self.currentPage) forKey:@"currentPage"];
        }];
    }
    succeed:^(id  _Nonnull data) {
        LNSafeBlockCall(success, data);
    } failed:^(NSError * _Nonnull error) {
        LNSafeBlockCall(failure, error);
    }];
    
    return request;
}



@end
