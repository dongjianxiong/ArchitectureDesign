//
//  LNLiveFocusListProvider.m
//  LNLiveModule
//
//  Created by Lenny on 2022/12/9.
//

#import "LNLiveFocusListProvider.h"
#import "LNLiveRoomModel.h"

@implementation LNLiveFocusListProvider

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
        video.coverUrl = @"https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF";
        LNLiveUserModel *creator = [[LNLiveUserModel alloc] init];
        creator.name = [NSString stringWithFormat:@"创建者%@", @(index)];
        creator.iconUrl = @"https://t7.baidu.com/it/u=1831997705,836992814&fm=193&f=GIF";
        video.anchor = creator;
        [datas addObject:video];
    }
    return [datas copy];
}

@end
