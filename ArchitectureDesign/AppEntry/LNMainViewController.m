//
//  LNMainViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNMainViewController.h"
#import "LNMineViewController.h"
#import "LNUIKitHelper.h"

#import <LNModuleProtocol/LNModuleProtocol.h>
#import <LNCommonKit/LNBaseMVC.h>

@interface LNMainViewController ()

@end

@implementation LNMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *backgroundColor = LNThemeBackgroundColor;
    UIColor *foregroundColor = LNThemeForegroundColor;
    
    self.tabBar.barTintColor = backgroundColor;
    self.tabBar.tintColor = foregroundColor;
    NSArray *titlesArr = @[@"首页",  @"直播", @"视频", @"我的"];
    NSArray *imagesArr = @[@"tabbar_home", @"tabbar_discovery", @"tabbar_follow", @"tabbar_usercenter"];
    UIViewController *vc = [LNAppModuleManger.feedModule getMainFeedViewController];
    LNBaseNavigationController *homeVc = [[LNBaseNavigationController alloc] initWithRootViewController:vc];
    homeVc.title = @"首页";
    
    UIViewController *vc2 = [LNAppModuleManger.liveModule getRecommendListViewController];
    LNBaseNavigationController *liveVc = [[LNBaseNavigationController alloc] initWithRootViewController:vc2];
    liveVc.title = @"直播";
    
    UIViewController *vc3 = [LNAppModuleManger.videoModule getRecommendTableViewController];
    LNBaseNavigationController *videoVc = [[LNBaseNavigationController alloc] initWithRootViewController:vc3];
    videoVc.title = @"视频";
    
    UIViewController *vc4 = [LNAppModuleManger.userCenterModule getMineViewController];
    LNBaseNavigationController *userCenterVc = [[LNBaseNavigationController alloc] initWithRootViewController:vc4];
    userCenterVc.title = @"我的";
    
    self.viewControllers = @[homeVc, liveVc, videoVc, userCenterVc];
//
    for (int index = 0; index < self.viewControllers.count; index++) {
        LNBaseNavigationController *vc = self.viewControllers[index];
        vc.tabBarItem.title = titlesArr[index];
        vc.tabBarItem.image = [UIImage imageNamed:imagesArr[index]];

        vc.navigationBar.barTintColor = backgroundColor;
        vc.navigationBar.tintColor = foregroundColor;
        vc.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: foregroundColor};
    }
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
