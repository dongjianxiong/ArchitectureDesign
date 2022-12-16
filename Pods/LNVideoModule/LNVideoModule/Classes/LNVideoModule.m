//
//  LNVideoModule.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/9.
//

#import "LNVideoModule.h"
#import "LNVideoModuleConfig.h"
#import "LNVideoMediatorDelegate.h"


//#define ADD_MODULE(MethodName, ModuleName, ProtocolName) __attribute__((constructor)) void MethodName(void){\
//static dispatch_once_t onceToken;\
//dispatch_once(&onceToken, ^{\
//[[LNModuleManager sharedInstance] addImpClassName:ModuleName protocolName:ProtocolName];\
//});\
//}
//
//#define ADD_VIDEO_MODULE ADD_MODULE(addModuleVideoModule, @"LNVideoModule", @"LNVideoModuleProtocol")

__attribute__((constructor)) void addModuleVideoModule(void){
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[LNModuleManager sharedInstance] addImpClassName:@"LNVideoModule" protocolName:@"LNVideoModuleProtocol"];
    });
}


@implementation LNVideoModule

- (void)doInitialize {
    
}

- (nonnull NSString *)version {
    return @"1.0.0";
}

- (UIViewController *)getRecommendTableViewController {
    return [LNVideoModuleConfig.mediator getRecommendTableViewController];

}

- (UIViewController *)getFocusTableViewController {
    return [LNVideoModuleConfig.mediator getFocusTableViewController];
}

- (UIViewController *)getPayerViewControllerWithUrlStr:(NSString *)urlStr {
    return [LNVideoModuleConfig.mediator getPayerViewControllerWithUrlStr:urlStr];
}


@end
