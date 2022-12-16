//
//  LNVideoModuleConfig.m
//  LNVideoModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNVideoModuleConfig.h"


@implementation LNVideoModuleConfig

static id<LNVideoMediatorDelegate> _mediator;

+ (void)setMediator:(id<LNVideoMediatorDelegate>)mediator
{
    _mediator = mediator;
}

+ (id<LNVideoMediatorDelegate>)mediator
{
    if (!_mediator) {
        Class class = NSClassFromString(@"LNVideoMediator");
        if (class) {
            _mediator = [class new];
        }
    }
    return _mediator;
}


@end
