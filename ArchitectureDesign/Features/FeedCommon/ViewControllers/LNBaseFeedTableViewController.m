//
//  LNBaseFeedTableViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNBaseFeedTableViewController.h"
#import "LNFeedImageTableViewCell.h"
#import "LNFeedVideoTableViewCell.h"

@interface LNBaseFeedTableViewController ()

@end

@implementation LNBaseFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    LNFeedCellLayout *feedLayout = self.dataArray[indexPath.row];
    LNFeedTableViewCell *cell = nil;
    if (feedLayout.feed.imageUrls.count > 0) {
        NSString *feedImageCellID = @"LNFeedImageTableViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:feedImageCellID];
        if (!cell) {
            cell = [[LNFeedImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:feedImageCellID];
        }
    }else if(feedLayout.feed.videoUrl){
        NSString *feedvideoCellID = @"LNFeedVideoTableViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:feedvideoCellID];
        if (!cell) {
            cell = [[LNFeedVideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:feedvideoCellID];
        }
    }else{
        NSString *cellID = @"LNFeedTableViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[LNFeedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
    }
    
    [cell reloadWithData:self.dataArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LNFeedCellLayout *layout = self.dataArray[indexPath.row];
    return layout.cellHeight;
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
