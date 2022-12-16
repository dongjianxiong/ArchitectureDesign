//
//  LNFeedRecommendListController.m
//  LNFeedModule
//
//  Created by Lenny on 2022/12/12.
//

#import "LNFeedRecommendListController.h"
#import "LNFeedRecommendListProvider.h"

@interface LNFeedRecommendListController ()

@end

@implementation LNFeedRecommendListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.provider = [LNFeedRecommendListProvider provider];
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
