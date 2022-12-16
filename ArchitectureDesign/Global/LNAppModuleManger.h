//
//  LNAppModuleManger.h
//  ArchitectureDesign
//
//  Created by Lenny on 2022/12/6.
//

#import <Foundation/Foundation.h>
#import <LNModuleProtocol/LNModuleProtocol.h>
NS_ASSUME_NONNULL_BEGIN

@interface LNAppModuleManger : NSObject

@property(nonatomic, strong, class) LNModuleManager *moduleManager;

@property(nonatomic, strong, class) id<LNAccountModuleProtocol> accountModule;

@property(nonatomic, strong, class) id<LNFeedModuleProtocol> feedModule;

@property(nonatomic, strong, class) id<LNLiveModuleProtocol> liveModule;

@property(nonatomic, strong, class) id<LNVideoModuleProtocol> videoModule;

@property(nonatomic, strong, class) id<LNUserCenterModuleProtocol> userCenterModule;


@end

NS_ASSUME_NONNULL_END
