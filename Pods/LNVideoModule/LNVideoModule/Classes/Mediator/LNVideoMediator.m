//
//  LNVideoMediator.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/9.
//

#import "LNVideoMediator.h"
#import "LNVideoRecommendListController.h"
#import "LNVideoFocusTableViewControler.h"
#import "LNVideoPlayerViewController.h"


@implementation LNVideoMediator

- (nonnull UIViewController *)getPayerViewControllerWithUrlStr:(nonnull NSString *)urlStr {
    LNVideoPlayerViewController *vc = [[LNVideoPlayerViewController alloc] initWithUrlStr:urlStr];
    return vc;
}

- (nonnull UIViewController *)getRecommendTableViewController {
    LNVideoRecommendListController *vc = [[LNVideoRecommendListController alloc] init];
    return vc;
}

- (nonnull UIViewController *)getFocusTableViewController {
    LNVideoFocusTableViewControler *vc = [[LNVideoFocusTableViewControler alloc] init];
    return vc;
}

@end
