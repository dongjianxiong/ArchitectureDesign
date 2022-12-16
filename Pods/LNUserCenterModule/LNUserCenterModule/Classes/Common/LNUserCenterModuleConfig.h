//
//  LNUserCenterModuleConfig.h
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/11.
//

#import <Foundation/Foundation.h>
#import "LNUserCenterMediatorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNUserCenterModuleConfig : NSObject

@property(nonatomic, strong, class) id<LNUserCenterMediatorDelegate> mediator;

@end

NS_ASSUME_NONNULL_END
