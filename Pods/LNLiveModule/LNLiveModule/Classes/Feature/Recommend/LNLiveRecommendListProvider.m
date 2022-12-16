//
//  LNLiveRecommendListProvider.m
//  LNLiveModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNLiveRecommendListProvider.h"
#import "LNLiveRoomModel.h"

@implementation LNLiveRecommendListProvider

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
        LNLiveRoomModel *video = [[LNLiveRoomModel alloc] init];
        video.title = [NSString stringWithFormat:@"视频%@", @(index)];
        video.coverUrl = @"https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF";
        LNLiveUserModel *creator = [[LNLiveUserModel alloc] init];
        creator.name = [NSString stringWithFormat:@"创建者%@", @(index)];
        creator.iconUrl = @"https://t7.baidu.com/it/u=2582370511,530426427&fm=193&f=GIF";
        video.anchor = creator;
        [datas addObject:video];
    }
    return [datas copy];
}
@end
