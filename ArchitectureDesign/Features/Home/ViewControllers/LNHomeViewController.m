//
//  LNHomeViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNHomeViewController.h"
#import "LNHomeDataController.h"
//#import <>

@interface LNHomeViewController ()<LNListDataResponseDelegate>


@end

@implementation LNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataController = [[LNHomeDataController alloc] init];
    self.dataController.pageSize = 20;
    [self startLoadData];
//    self.ta
    // Do any additional setup after loading the view.
}


@end
