//
//  LNFeedVideoTableViewCell.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/1.
//

#import "LNFeedVideoTableViewCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation LNFeedVideoTableViewCell


- (void)updateSubviewsLayout
{
    [super updateSubviewsLayout];
    self.videoPlayerView.frame = self.feedLayout.imageCollectFrame;
    [self.videoPlayerView sd_setImageWithURL:[NSURL URLWithString:self.feedLayout.feed.videoUrl]];
}

- (UIImageView *)videoPlayerView
{
    if (!_videoPlayerView) {
        _videoPlayerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
        [self.contentView addSubview:_videoPlayerView];
    }
    return _videoPlayerView;
}

@end
