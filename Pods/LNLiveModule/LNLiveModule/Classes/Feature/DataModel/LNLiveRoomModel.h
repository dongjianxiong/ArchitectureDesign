//
//  LNLiveRoomModel.h
//  LNLiveRoomModel
//
//  Created by Lenny on 2022/12/11.
//

#import <LNCommonKit/LNCommonKit.h>
#import "LNLiveUserModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface LNLiveRoomModel : LNBaseModel

@property(nonatomic, copy) NSString *roomId;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, copy) NSString *url;

@property(nonatomic, copy) NSString *iconUrl;

@property(nonatomic, copy) NSString *coverUrl;

@property(nonatomic, assign) NSInteger timeInterval;

@property(nonatomic, assign) NSInteger createTime;


@property(nonatomic, strong) LNLiveUserModel *anchor;

- (NSURL *)realUrl;
- (NSURL *)iconRealUrl;
- (NSURL *)coverRealUrl;

- (NSString *)timeIntervalToTimeString;
- (NSString *)createTimeToTimeString;
@end

NS_ASSUME_NONNULL_END
