//
//  LNFeedInfoView.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import <UIKit/UIKit.h>
#import "LNFeed.h"
#import "LNFeedViewEventDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@class LNFeedInfoView;
@protocol LNFeedInfoViewEventDelegate <NSObject>

- (void)feedInfoView:(LNFeedInfoView *)infoView
   clickeOnLikeButton:(UIButton *)button;
- (void)feedInfoView:(LNFeedInfoView *)infoView
  clickeOnStoreButton:(UIButton *)button;
- (void)feedInfoView:(LNFeedInfoView *)infoView
clickeOnCommentButton:(UIButton *)button;

@end

@interface LNFeedInfoView : UIView

@property(nonatomic, strong) UILabel *likeCountLabel;

@property(nonatomic, strong) UILabel *storeCountLabel;

@property(nonatomic, strong) UILabel *commentCountLabel;

@property(nonatomic, strong) UIButton *likeImageView;

@property(nonatomic, strong) UIButton *storeImageView;

@property(nonatomic, strong) UIButton *commentImageView;

@property(nonatomic, weak)   id<LNFeedInfoViewEventDelegate> delegate;

- (void)reloadWithData:(LNFeed *)feedModel;

- (void)updateSubviewsLayout;

@end

NS_ASSUME_NONNULL_END
