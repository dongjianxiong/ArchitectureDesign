//
//  LNUserCenterMediator.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/9.
//

#import "LNUserCenterMediator.h"
#import "LNMineViewController.h"
#import "LNUserCenterViewController.h"
#import "LNFansUserTableViewController.h"
#import "LNFocusUserTableViewController.h"
#import "LNFriendUserTableViewController.h"


@implementation LNUserCenterMediator


- (UIViewController *)getMineViewController{
    LNMineViewController *vc = [[LNMineViewController alloc] init];
    vc.title = @"我的";
    return vc;
}

- (UIViewController *)getUserCenterViewControllerWithUserId:(NSString *)userId{
    LNUserCenterViewController *vc = [[LNUserCenterViewController alloc] init];
    return vc;
}

- (UIViewController *)getFriendTableViewController{
    LNFriendUserTableViewController *vc = [[LNFriendUserTableViewController alloc] init];
    return vc;
}


- (UIViewController *)getFansTableViewController{
    LNFansUserTableViewController *vc = [[LNFansUserTableViewController alloc] init];
    return vc;
}


- (UIViewController *)getFocusTableViewController{
    LNFocusUserTableViewController *vc = [[LNFocusUserTableViewController alloc] init];
    return vc;
}


@end
