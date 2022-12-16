//
//  LNFeedTableViewCell.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNBaseTableViewCell.h"
#import "LNFeedInfoView.h"
#import "LNFeedCellLayout.h"
#import "LNFeedViewEventDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNFeedTableViewCell : LNBaseTableViewCell

@property(nonatomic, strong) LNFeedCellLayout *feedLayout;

@property(nonatomic, weak) id<LNFeedViewEventDelegate> delegate;

@property(nonatomic, strong) UIImageView *userPortrait;

@property(nonatomic, strong) UILabel *userNameLabel;

@property(nonatomic, strong) UITextView *contentLabel;

@property(nonatomic, strong) LNFeedInfoView *infoView;

@property(nonatomic, strong) UITextView *forwardFeedLabel;

@property(nonatomic, strong) UILabel *timeLabel;

- (void)reloadWithData:(LNFeedCellLayout *)feedLayout;

@end

NS_ASSUME_NONNULL_END
