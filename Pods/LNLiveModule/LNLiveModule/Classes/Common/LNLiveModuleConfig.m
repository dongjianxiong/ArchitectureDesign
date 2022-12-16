//
//  LNLiveModuleConfig.m
//  LNLiveModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNLiveModuleConfig.h"


@implementation LNLiveModuleConfig

static id<LNLiveMediatorDelegate> _mediator;

+ (void)setMediator:(id<LNLiveMediatorDelegate>)mediator
{
    _mediator = mediator;
}

+ (id<LNLiveMediatorDelegate>)mediator
{
    if (!_mediator) {
        Class class = NSClassFromString(@"LNLiveMediator");
        if (class) {
            _mediator = [class new];
        }
    }
    return _mediator;
}


@end
