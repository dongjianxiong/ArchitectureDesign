//
//  LNAppModuleManger.m
//  ArchitectureDesign
//
//  Created by Lenny on 2022/12/6.
//

#import "LNAppModuleManger.h"
#import <LNModuleCore/LNModuleCore.h>

@implementation LNAppModuleManger


static LNModuleManager *_moduleManager = nil;
static id<LNAccountModuleProtocol> _accountModule = nil;
static id<LNFeedModuleProtocol> _feedModule = nil;
static id<LNLiveModuleProtocol> _liveModule = nil;
static id<LNVideoModuleProtocol> _videoModule = nil;
static id<LNUserCenterModuleProtocol> _userCenterModule = nil;

#pragma mark - 
+ (LNModuleManager *)moduleManager
{
    if (!_moduleManager) {
        _moduleManager = [LNModuleManager sharedInstance];
    }
    return _moduleManager;
}

+ (void)setModuleManager:(LNModuleManager *)moduleManager
{
    _moduleManager = moduleManager;
}

#pragma mark -
+ (id<LNAccountModuleProtocol>)accountModule
{
    if (!_accountModule) {
        _accountModule = [[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNAccountModuleProtocol)];
    }
    return _accountModule;
}

+ (void)setAccountModule:(id<LNAccountModuleProtocol>)accountModule
{
    _accountModule = accountModule;
}


#pragma mark -
+ (id<LNFeedModuleProtocol>)feedModule
{
    if (!_feedModule) {
        _feedModule = [[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNFeedModuleProtocol)];
    }
    return _feedModule;
}

+ (void)setFeedModule:(id<LNFeedModuleProtocol>)feedModule
{
    _feedModule = feedModule;
}


#pragma mark -
+ (id<LNLiveModuleProtocol>)liveModule
{
    if (!_liveModule) {
        _liveModule = [[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNLiveModuleProtocol)];
    }
    return _liveModule;
}

+ (void)setLiveModule:(id<LNLiveModuleProtocol>)liveModule
{
    _liveModule = liveModule;
}


#pragma mark -
+ (id<LNVideoModuleProtocol>)videoModule
{
    if (!_videoModule) {
        _videoModule = [[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNVideoModuleProtocol)];
    }
    return _videoModule;
}

+ (void)setVideoModule:(id<LNVideoModuleProtocol>)videoModule
{
    _videoModule = videoModule;
}

#pragma mark -
+ (id<LNUserCenterModuleProtocol>)userCenterModule
{
    if (!_userCenterModule) {
        _userCenterModule = [[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNUserCenterModuleProtocol)];
    }
    return _userCenterModule;
}

+ (void)setUserCenterModule:(id<LNUserCenterModuleProtocol>)userCenterModule
{
    _userCenterModule = userCenterModule;
}


@end
