//
//  LNBaseTableViewController.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import <UIKit/UIKit.h>
#import "LNBaselistDataController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LNBaseTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, LNListDataResponseDelegate>

@property (nonatomic, strong) id<LNListDataOperationAdapter> dataController;

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

- (void)startLoadData;

@end

NS_ASSUME_NONNULL_END
