//
//  LNVideoModel.h
//  LNVideoModel
//
//  Created by Lenny on 2022/12/11.
//

#import <LNCommonKit/LNCommonKit.h>
#import "LNVideoUserModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface LNVideoModel : LNBaseModel

@property(nonatomic, copy) NSString *videoId;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, copy) NSString *url;

@property(nonatomic, copy) NSString *iconUrl;

@property(nonatomic, copy) NSString *coverUrl;

@property(nonatomic, assign) NSInteger timeInterval;

@property(nonatomic, assign) NSInteger createTime;


@property(nonatomic, strong) LNVideoUserModel *creator;

- (NSURL *)realUrl;
- (NSURL *)iconRealUrl;
- (NSURL *)coverRealUrl;

- (NSString *)timeIntervalToTimeString;
- (NSString *)createTimeToTimeString;
@end

NS_ASSUME_NONNULL_END
