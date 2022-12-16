//
//  LNUserCenterModuleConfig.m
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNUserCenterModuleConfig.h"


@implementation LNUserCenterModuleConfig

static id<LNUserCenterMediatorDelegate> _mediator;

+ (void)setMediator:(id<LNUserCenterMediatorDelegate>)mediator
{
    _mediator = mediator;
}

+ (id<LNUserCenterMediatorDelegate>)mediator
{
    if (!_mediator) {
        Class class = NSClassFromString(@"LNUserCenterMediator");
        if (class) {
            _mediator = [class new];
        }
    }
    return _mediator;
}


@end
