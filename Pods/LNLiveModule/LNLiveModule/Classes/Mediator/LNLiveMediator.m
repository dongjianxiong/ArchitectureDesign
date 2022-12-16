//
//  LNLiveMediator.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/9.
//

#import "LNLiveMediator.h"
#import "LNLiveRecommendListController.h"
#import "LNLiveFocusTableViewControler.h"
#import "LNAnchorLiveRoomViewController.h"
#import "LNViewerLiveRoomViewController.h"

@implementation LNLiveMediator

- (nonnull UIViewController *)getRecommendTableViewController {
    LNLiveRecommendListController *vc = [[LNLiveRecommendListController alloc] init];
    return vc;
}

- (nonnull UIViewController *)getFocusTableViewController {
    LNLiveFocusTableViewControler *vc = [[LNLiveFocusTableViewControler alloc] init];
    return vc;
}

- (UIViewController *)getTimeLineListViewController
{
    LNLiveRecommendListController *vc = [[LNLiveRecommendListController alloc] init];
    return vc;
}

- (UIViewController *)getLiveRoomViewControllerWithRoomId:(NSString *)roomId
{
    LNViewerLiveRoomViewController *vc = [[LNViewerLiveRoomViewController alloc] init];
    return vc;
}

- (UIViewController *)getLiveAnchorViewControllerWithUserId:(NSString *)userId
{
    LNAnchorLiveRoomViewController *vc = [[LNAnchorLiveRoomViewController alloc] init];
    return vc;
}


@end
