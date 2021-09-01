//
//  LNFeedTableViewCell.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import <UIKit/UIKit.h>
#import "LNFeedInfoView.h"
#import "LNFeedCellLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNFeedTableViewCell : UITableViewCell

@property(nonatomic, strong) LNFeedCellLayout *feedLayout;

@property(nonatomic, strong) UIImageView *userPortrait;

@property(nonatomic, strong) UILabel *userNameLabel;

@property(nonatomic, strong) UILabel *contentLabel;

@property(nonatomic, strong) LNFeedInfoView *infoView;

@property(nonatomic, strong) UILabel *forwardFeedLabel;

- (void)reloadWithData:(LNFeedCellLayout *)feedLayout;

- (void)updatelayout;

- (void)updateStyle;

@end

NS_ASSUME_NONNULL_END
