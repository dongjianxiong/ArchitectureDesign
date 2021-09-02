//
//  LNBaselistDataController.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LNListRequestCompletion)(NSArray *dataList, NSError * _Nullable error);

@protocol LNListDataOperationAdapter;
@protocol LNListDataResponseDelegate <NSObject>

- (void)startRefresh:(id<LNListDataOperationAdapter>)dataController;

- (void)startLoadMore:(id<LNListDataOperationAdapter>)dataController;

- (void)refreshResponse:(id<LNListDataOperationAdapter>)dataController
                  error:(NSError *)error;

- (void)loadMoreResponse:(id<LNListDataOperationAdapter>)dataController
                   error:(NSError *)error;

- (void)dataController:(id<LNListDataOperationAdapter>)dataController
  changedObjectAtIndex:(NSInteger)index;

- (void)dataController:(id<LNListDataOperationAdapter>)dataController
  deletedObjectAtIndex:(NSInteger)index;

@end


@protocol LNListDataOperationAdapter <NSObject>

@property(nonatomic, assign, readonly) NSInteger currentPage;

@property(nonatomic, assign) NSInteger pageSize;

@property(nonatomic, strong, readonly) NSMutableArray *dataList;

@property(nonatomic, weak) id<LNListDataResponseDelegate> delegate;

- (void)refreshData;

- (void)loadMoreData;

- (void)stopLoadData;

- (void)removeObjectAtIndex:(NSInteger)index;

- (void)insertObject:(id)object atIndex:(NSInteger)index;

- (void)addObject:(id)object;

- (void)replaceObject:(id)object atIndex:(NSInteger)index;

@end



@interface LNBaselistDataController : NSOperation<LNListDataOperationAdapter>

@end

NS_ASSUME_NONNULL_END
