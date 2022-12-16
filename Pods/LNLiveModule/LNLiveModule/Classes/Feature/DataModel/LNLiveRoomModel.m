//
//  LNLiveRoomModel.m
//  LNLiveRoomModel
//
//  Created by Lenny on 2022/12/11.
//

#import "LNLiveRoomModel.h"

@implementation LNLiveRoomModel

- (NSURL *)realUrl
{
    return [NSURL URLWithString:_url];
}

- (NSURL *)iconRealUrl
{
    return [NSURL URLWithString:_iconUrl];
}

- (NSURL *)coverRealUrl
{
    return [NSURL URLWithString:_coverUrl];
}

- (NSString *)timeIntervalToTimeString
{
    return @"02:05:45";
}

- (NSString *)createTimeToTimeString
{
    return @"2019-12-1 23:13:01";
}

@end
