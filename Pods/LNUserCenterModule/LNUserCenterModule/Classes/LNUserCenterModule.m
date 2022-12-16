//
//  LNUserCenterModule.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/9.
//

#import "LNUserCenterModule.h"
#import <LNCommonKit/LNCommonKit.h>
#import "LNUserCenterModuleConfig.h"
#import "LNUserCenterMediatorDelegate.h"


__attribute__((constructor)) void addModuleUserCenterModule(void){
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[LNModuleManager sharedInstance] addImpClassName:@"LNUserCenterModule" protocolName:@"LNUserCenterModuleProtocol"];
    });
}


@implementation LNUserCenterModule

- (void)doInitialize {
    
}

- (nonnull NSString *)version {
    return @"1.0.0";
}

- (void)getUserInfoWithCompletion:(LNUserInfoBlock)block
{
    
}

- (UIViewController *)getMineViewController{
    return [LNUserCenterModuleConfig.mediator getMineViewController];
}

- (UIViewController *)getUserCenterViewControllerWithUserId:(NSString *)userId{
    return [LNUserCenterModuleConfig.mediator getUserCenterViewControllerWithUserId:userId];
}



@end
