//
//  LNTopicFeedTableViewController.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNBaseFeedTableViewController.h"
#import "LNTopic.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNTopicFeedTableViewController : LNBaseFeedTableViewController

@property(nonatomic, strong) LNTopic *topic;

@end

NS_ASSUME_NONNULL_END
