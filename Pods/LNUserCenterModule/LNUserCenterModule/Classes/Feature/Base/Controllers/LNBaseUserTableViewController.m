//
//  LNBaseUserTableViewController.m
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNBaseUserTableViewController.h"
#import "LNUserTableViewCell.h"
#import "LNUserModel.h"
#import "LNUserCenterModuleConfig.h"


@interface LNBaseUserTableViewController ()

@end

@implementation LNBaseUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.rowHeight = 60;
    // Do any additional setup after loading the view.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"LNUserCenterTableViewCell";
    LNUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[LNUserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    LNUserModel *user = self.dataArray[indexPath.row];
    [cell reloadWithData:user];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LNUserModel *user = self.dataArray[indexPath.row];
    UIViewController *vc = [LNUserCenterModuleConfig.mediator getUserCenterViewControllerWithUserId:user.userId];
    [self ln_pushViewController:vc];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
