//
//  LNVideoFocusListProvider.m
//  LNVideoModule
//
//  Created by Lenny on 2022/12/9.
//

#import "LNVideoFocusListProvider.h"
#import "LNVideoModel.h"

@implementation LNVideoFocusListProvider

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
        LNVideoModel *video = [[LNVideoModel alloc] init];
        video.title = [NSString stringWithFormat:@"视频%@", @(index)];
        video.coverUrl = @"https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF";
        LNVideoUserModel *creator = [[LNVideoUserModel alloc] init];
        creator.name = [NSString stringWithFormat:@"创建者%@", @(index)];
        creator.iconUrl = @"https://t7.baidu.com/it/u=4198287529,2774471735&fm=193&f=GIF";
        video.creator = creator;
        [datas addObject:video];
    }
    return [datas copy];
}

@end
