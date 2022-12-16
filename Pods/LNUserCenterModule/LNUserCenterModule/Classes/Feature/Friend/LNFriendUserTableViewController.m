//
//  LNFriendUserTableViewController.m
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/9.
//

#import "LNFriendUserTableViewController.h"
#import "LNFriendUserListProvider.h"


@interface LNFriendUserTableViewController ()

@end

@implementation LNFriendUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 260;

    self.provider = [LNFriendUserListProvider provider];
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
