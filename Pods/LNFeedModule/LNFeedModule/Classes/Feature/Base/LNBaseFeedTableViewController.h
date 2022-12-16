//
//  LNBaseFeedTableViewController.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNBaseTableViewController.h"
#import "LNFeedTableViewCell.h"
#import "LNFeedModelConfig.h"


NS_ASSUME_NONNULL_BEGIN

@interface LNBaseFeedTableViewController : LNBaseTableViewController

@property(nonatomic, strong, readonly) id<LNFeedMediatorDelegate> mediator;

@end

NS_ASSUME_NONNULL_END
