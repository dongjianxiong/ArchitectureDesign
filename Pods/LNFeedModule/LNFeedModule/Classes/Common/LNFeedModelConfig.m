//
//  LNFeedModelConfig.m
//  LNFeed
//
//  Created by Lenny on 2021/10/22.
//

#import "LNFeedModelConfig.h"

@implementation LNFeedModelConfig

+ (id<LNFeedMediatorDelegate>)feeMediator
{
    static id<LNFeedMediatorDelegate> obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[NSClassFromString(@"LNFeedMediator") alloc] init];
    });
     
    return obj;
}

+(NSBundle *)feedBundle
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *feedBundlePath = [bundle.resourcePath stringByAppendingPathComponent:@"LNFeedModule.bundle"];
    NSBundle *feedBundle = [NSBundle bundleWithPath:feedBundlePath];
    return feedBundle;
}

+(id<LNAccountModuleProtocol>)accountDelegate
{
    id<LNAccountModuleProtocol> accountModule = [[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNAccountModuleProtocol)];
    return accountModule;
}

@end
