//
//  LNFeedInfoView.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import <UIKit/UIKit.h>
#import "LNFeed.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNFeedInfoView : UIView

@property(nonatomic, strong) UILabel *likeCountLabel;

@property(nonatomic, strong) UILabel *storeCountLabel;

@property(nonatomic, strong) UILabel *commentCountLabel;

@property(nonatomic, strong) UIImageView *likeImageView;

@property(nonatomic, strong) UIImageView *storeImageView;

@property(nonatomic, strong) UIImageView *commentImageView;

- (void)reloadWithData:(LNFeed *)feedModel;

- (void)updateSubviewsLayout;

@end

NS_ASSUME_NONNULL_END
