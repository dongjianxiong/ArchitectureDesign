//
//  LNFeedModule.m
//  FBSnapshotTestCase
//
//  Created by Lenny on 2020/6/30.
//

#import "LNFeedModule.h"
#import "LNFeedModelConfig.h"
#import <LNModuleProtocol/LNFeedModuleProtocol.h>
#import <LNModuleCore/LNModuleCore.h>

//注册类名和协议名称
__attribute__((constructor)) void addModuleLNFeedModule(void){
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[LNModuleManager sharedInstance] addImpClassName:@"LNFeedModule" protocolName:@"LNFeedModuleProtocol"];
    });
}


@interface LNFeedModule ()<LNFeedModuleProtocol>

/**
 * feed Mediator 代理
 */
@property(nonatomic, strong) id<LNFeedMediatorDelegate> feedMediator;


@end

@implementation LNFeedModule

- (id<LNFeedMediatorDelegate>)feedMediator
{
    if (!_feedMediator) {
        _feedMediator = [LNFeedModelConfig feeMediator];
    }
    return _feedMediator;
}

#pragma mark - LNFeedModuleProtocol

- (UIViewController *)getMainFeedViewController {
    UIViewController *feedVC = [self.feedMediator createFeedMainVC];
    return feedVC;
}

- (UIViewController *)getFeedDetailViewControllerWithFeedId:(NSString *)feedId
{
    UIViewController *feedVC = [self.feedMediator createFeedDetailVCWithFeedId:feedId];
    return feedVC;
}

- (UIViewController *)getRecommendFeedViewController {
    
    UIViewController *feedVC = [self.feedMediator createFeedRecommendVC];
    return feedVC;
}

- (UIViewController *)getTimeLineFeedViewController {
    UIViewController *feedVC = [self.feedMediator createFeedTimeLineVC];
    return feedVC;
}

- (void)doInitialize {
    NSLog(@"Init finish");
}

- (NSString *)version {
    return @"0.1.4";
}

@end
