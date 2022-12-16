//
//  LNVideoModuleConfig.h
//  LNVideoModule
//
//  Created by Lenny on 2022/12/11.
//

#import <Foundation/Foundation.h>
#import "LNVideoMediatorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNVideoModuleConfig : NSObject

@property(nonatomic, strong, class) id<LNVideoMediatorDelegate> mediator;

@end

NS_ASSUME_NONNULL_END
