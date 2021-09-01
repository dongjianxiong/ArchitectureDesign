//
//  LNMainViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNMainViewController.h"
#import "LNHomeViewController.h"
#import "LNTimeLineViewController.h"
#import "LNMineViewController.h"


@interface LNMainViewController ()

@end

@implementation LNMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LNHomeViewController *homeVc = [[LNHomeViewController alloc] init];
    homeVc.title = @"首页";
    [self addChildViewController:homeVc];
    
    LNTimeLineViewController *timeLineVc = [[LNTimeLineViewController alloc] init];
    timeLineVc.title = @"最新";
    [self addChildViewController:timeLineVc];
    
    LNMineViewController *mineVc = [[LNMineViewController alloc] init];
    mineVc.title = @"我的";
    [self addChildViewController:mineVc];
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
