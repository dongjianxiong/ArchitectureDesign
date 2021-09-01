//
//  LNBaselistDataController.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNBaselistDataController.h"

@interface LNBaselistDataController ()

@property(nonatomic, assign, readwrite) NSInteger currentPage;
@property(nonatomic, assign, readwrite) NSInteger pageSize;
@property(nonatomic, strong, readwrite) NSMutableArray *dataList;

@end

@implementation LNBaselistDataController

@synthesize delegate = _delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentPage = 0;
        self.dataList = [[NSMutableArray alloc] init];
        self.pageSize = 50;
    }
    return self;
}

- (void)setDelegate:(id<LNListDataResponseDelegate>)delegate
{
    _delegate = delegate;
}

- (id<LNListDataResponseDelegate>)delegate
{
    return _delegate;
}


- (void)loadData
{
    if (self.currentPage == 0) {
        [self refreshData];
    }else{
        [self loadMoreData];
    }
}


- (void)refreshData
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(startRefresh:)]) {
        [self.delegate startRefresh:self];
    }
    [self requestWithCompletion:^(NSArray *dataList, NSError *error) {

        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                [self.dataList removeAllObjects];
                [self.dataList addObjectsFromArray:dataList];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(refreshResponse:error:)]) {
                [self.delegate refreshResponse:self error:error];
            }
        });
    }];
}

- (void)loadMoreData
{
    self.currentPage += 1;
    if (self.delegate && [self.delegate respondsToSelector:@selector(startLoadMore:)]) {
        [self.delegate startLoadMore:self];
    }
    [self requestWithCompletion:^(NSArray *dataList, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                [self.dataList addObjectsFromArray:dataList];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(loadMoreResponse:error:)]) {
                [self.delegate loadMoreResponse:self error:error];
            }
        });
    }];
}

- (void)requestWithCompletion:(LNListRequestCompletion)completion
{
    
}

- (void)loadDataCancel
{
    NSLog(@"取消请求");
}

- (void)insertObject:(id)object atIndex:(NSInteger)index
{
    [self insertObject:object atIndex:index];
}

- (void)addObject:(nonnull id)object {
    [self.dataList addObject:object];
}


- (void)removeObjectAtIndex:(NSInteger)index {
    if (self.dataList.count <= index) {
        return;
    }
    [self.dataList removeObjectAtIndex:index];
}

- (void)replaceObject:(id)object atIndex:(NSInteger)index
{
    if (self.dataList.count <= index) {
        return;
    }
    [self.dataList replaceObjectAtIndex:index withObject:object];
}


@end
