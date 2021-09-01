//
//  LNHomeViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNHomeViewController.h"
#import "LNHomeDataController.h"

@interface LNHomeViewController ()<LNListDataResponseDelegate>


@end

@implementation LNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataController = [[LNHomeDataController alloc] init];
    [self.dataController loadData];
    
    // Do any additional setup after loading the view.
}


//- (void)dataController:(nonnull id<LNListDataOperationAdapter>)dataController changedObjectAtIndex:(NSInteger)index {
//    
//}
//
//- (void)dataController:(nonnull id<LNListDataOperationAdapter>)dataController deletedObjectAtIndex:(NSInteger)index {
//
//}
//
//- (void)loadMoreResponse:(nonnull id<LNListDataOperationAdapter>)dataController error:(nonnull NSError *)error {
//    
//}
//
//- (void)refreshResponse:(nonnull id<LNListDataOperationAdapter>)dataController error:(nonnull NSError *)error {
//    
//}


@end
