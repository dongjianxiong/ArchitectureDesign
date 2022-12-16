//
//  LNLiveModule.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/9.
//

#import "LNLiveModule.h"
#import "LNLiveModuleConfig.h"
#import "LNLiveMediatorDelegate.h"


__attribute__((constructor)) void addModuleVideoModule(void){
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[LNModuleManager sharedInstance] addImpClassName:@"LNLiveModule" protocolName:@"LNLiveModuleProtocol"];
    });
}


@implementation LNLiveModule

- (void)doInitialize {
    
}

- (nonnull NSString *)version {
    return @"1.0.0";
}

- (UIViewController *)getRecommendListViewController
{
    return [LNLiveModuleConfig.mediator getRecommendTableViewController];

}

- (UIViewController *)getFocusListViewController
{
    return [LNLiveModuleConfig.mediator getFocusTableViewController];
}

- (UIViewController *)getTimeLineListViewController
{
    return [LNLiveModuleConfig.mediator getTimeLineListViewController];

}

- (UIViewController *)getLiveRoomViewControllerWithRoomId:(NSString *)roomId
{
    return [LNLiveModuleConfig.mediator getLiveRoomViewControllerWithRoomId:roomId];

}

- (UIViewController *)getLiveAnchorViewControllerWithUserId:(NSString *)userId
{
    return [LNLiveModuleConfig.mediator getLiveAnchorViewControllerWithUserId:userId];

}



@end
