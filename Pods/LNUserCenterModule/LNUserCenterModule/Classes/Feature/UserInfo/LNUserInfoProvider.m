//
//  LNUserInfoProvider.m
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNUserInfoProvider.h"

@implementation LNUserInfoProvider

- (LNHTTPRequest *)requestWithSuccess:(LNRequestSuccessBlock)success
                              failure:(LNRequestFailureBlock)failure
{
    return [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.urlPath = @"userCenter/getUserInfo";
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            if(self.userId){
                [params setObject:self.userId forKey:@"userId"];
            }else{
                [params setObject:@"longinUserId" forKey:@"userId"];
            }
        }];
    } succeed:^(id  _Nonnull data) {
        LNSafeBlockCall(success, data);
    } failed:^(NSError * _Nonnull error) {
        LNSafeBlockCall(failure, error);
    }];
}

@end
