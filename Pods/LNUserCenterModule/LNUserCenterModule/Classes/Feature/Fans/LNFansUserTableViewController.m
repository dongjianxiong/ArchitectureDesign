//
//  LNFocusTableViewController.m
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/9.
//

#import "LNFansUserTableViewController.h"
#import "LNFansUserListProvider.h"

@interface LNFansUserTableViewController ()

@end

@implementation LNFansUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 260;
    
    self.provider = [LNFansUserListProvider provider];
    [self.provider refreshData];
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
