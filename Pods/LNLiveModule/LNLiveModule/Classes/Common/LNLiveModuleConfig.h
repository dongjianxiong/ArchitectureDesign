//
//  LNLiveModuleConfig.h
//  LNLiveModule
//
//  Created by Lenny on 2022/12/11.
//

#import <Foundation/Foundation.h>
#import "LNLiveMediatorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNLiveModuleConfig : NSObject

@property(nonatomic, strong, class) id<LNLiveMediatorDelegate> mediator;

@end

NS_ASSUME_NONNULL_END
