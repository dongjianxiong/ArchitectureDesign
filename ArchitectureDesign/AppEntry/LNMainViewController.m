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
    
    
//    dispatch_queue_t queue = dispatch_queue_create("com.djx.serial", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue = dispatch_queue_create("com.djx.serial", DISPATCH_QUEUE_CONCURRENT);
//    for (int i = 0; i < 100; i++) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            dispatch_sync(queue, ^{
//                if (i == 0) {
//                    sleep(2);
//                }
//                if (i == 2) {
//                    sleep(1);
//                }
//                if (i == 10) {
//                    sleep(0.5);
//                }
//                NSLog(@"%@", @(i));
//            });
//        });;
//    }
//
    
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
