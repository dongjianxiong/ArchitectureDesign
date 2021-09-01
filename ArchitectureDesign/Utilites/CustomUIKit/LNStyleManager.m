//
//  LNStyleManager.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNStyleManager.h"

#define LNSyFontSize(X) [UIFont systemFontOfSize:X]



@implementation LNStyleManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _systemFont15 = [UIFont systemFontOfSize:15];
        _systemFont14 = [UIFont systemFontOfSize:14];
        _systemFont13 = [UIFont systemFontOfSize:13];
        _systemFont12 = [UIFont systemFontOfSize:12];
        _systemFont11 = [UIFont systemFontOfSize:11];
        _systemFont10 = [UIFont systemFontOfSize:10];
        _systemFont9 = [UIFont systemFontOfSize:9];
        _systemFont8 = [UIFont systemFontOfSize:8];
    }
    return self;
}

+ (LNStyleManager *)sharedManager
{
    static LNStyleManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LNStyleManager alloc] init];
    });
    return instance;
}

@end
