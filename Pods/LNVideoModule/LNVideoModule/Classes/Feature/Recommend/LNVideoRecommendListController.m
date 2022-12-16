//
//  LNVideoRecommendListController.m
//  LNVideoModule
//
//  Created by Lenny on 2022/12/9.
//

#import "LNVideoRecommendListController.h"
#import "LNVideoRecommendListProvider.h"
#import "LNVideoTableViewCell.h"
#import "LNVideoModel.h"
#import "LNVideoModuleConfig.h"

@interface LNVideoRecommendListController ()

@end

@implementation LNVideoRecommendListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 260;
    
    self.provider = [LNVideoRecommendListProvider provider];
    [self.provider refreshData];
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"LNVideoTableViewCell";
    LNVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[LNVideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    LNVideoModel *video = self.dataArray[indexPath.row];
    [cell reloadWithData:video];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LNVideoModel *video = self.dataArray[indexPath.row];
    UIViewController *vc = [LNVideoModuleConfig.mediator getPayerViewControllerWithUrlStr:video.url];
    [self ln_pushViewController:vc];
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
