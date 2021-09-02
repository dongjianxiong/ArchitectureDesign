//
//  LNBaseTableViewController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNBaseTableViewController.h"
#import "LNCusomUIKitHelper.h"
#import <MJRefresh/MJRefresh.h>

@interface LNBaseTableViewController ()

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, assign) CFAbsoluteTime loadingTime;

@end

@implementation LNBaseTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 200;
    [self.view addSubview:self.tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataController refreshData];
     }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.dataController loadMoreData];
    }];
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.indicatorView.center = CGPointMake(LNUIScreenWidth/2, LNUIScreenHeight/2);
    self.indicatorView.color = [UIColor grayColor];
    [self.view addSubview:self.indicatorView];
    // Do any additional setup after loading the view.
}

- (void)startLoadData
{
    //马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self.tableView reloadData];
}

- (void)setDataController:(id<LNListDataOperationAdapter>)dataController
{
    _dataController = dataController;
    _dataController.delegate = self;
}

#pragma mark - LNListDataResponseDelegate

#pragma mark - LNListDataOperationAdapter

- (void)startRefresh:(id<LNListDataOperationAdapter>)dataController
{
    [self.indicatorView startAnimating];
    self.loadingTime = CFAbsoluteTimeGetCurrent();
}

- (void)startLoadMore:(id<LNListDataOperationAdapter>)dataController
{
    [self.indicatorView startAnimating];
}


- (void)refreshResponse:(id<LNListDataOperationAdapter>)dataController error:(NSError *)error
{
    if (error) {
        NSLog(@"error:%@", error);
    }else{
        self.dataArray = [dataController.dataList copy];

    }
    [self.indicatorView stopAnimating];
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    NSLog(@"加载时间：%@", @(endTime - self.loadingTime));
    [self.tableView.mj_header endRefreshing];
}

- (void)loadMoreResponse:(id<LNListDataOperationAdapter>)dataController error:(NSError *)error
{
    if (error) {
        NSLog(@"error:%@", error);
    }else{
        self.dataArray = [dataController.dataList copy];

    }
    [self.indicatorView stopAnimating];
    [self.tableView.mj_footer endRefreshing];
}

- (void)dataController:(nonnull id<LNListDataOperationAdapter>)dataController changedObjectAtIndex:(NSInteger)index {
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}


- (void)dataController:(nonnull id<LNListDataOperationAdapter>)dataController deletedObjectAtIndex:(NSInteger)index {
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}



@end
