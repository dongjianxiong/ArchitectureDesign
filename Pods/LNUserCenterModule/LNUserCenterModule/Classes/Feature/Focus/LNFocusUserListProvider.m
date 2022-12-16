//
//  LNFocusUserListProvider.m
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNFocusUserListProvider.h"
#import "LNUserModel.h"

@implementation LNFocusUserListProvider

- (LNHTTPRequest *)requestWithSuccess:(LNRequestSuccessBlock)success
                              failure:(LNRequestFailureBlock)failure
{
    return [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.urlPath = @"";
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:@(self.pageSize) forKey:@"pageSize"];
            [params setObject:@(self.currentPage) forKey:@"pageNum"];
        }];
    } succeed:^(id  _Nonnull data) {
        LNSafeBlockCall(success, data);
    } failed:^(NSError * _Nonnull error) {
        LNSafeBlockCall(failure, error);
        LNSafeBlockCall(success, [self localDatas]);
    }];
}

- (NSArray *)localDatas
{
    NSMutableArray *datas = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        LNUserModel *user = [[LNUserModel alloc] init];
        user.name = [NSString stringWithFormat:@"我的关注%@", @(index)];
        user.iconUrl = @"https://t7.baidu.com/it/u=2582370511,530426427&fm=193&f=GIF";
        [datas addObject:user];
    }
    return [datas copy];
}
@end
