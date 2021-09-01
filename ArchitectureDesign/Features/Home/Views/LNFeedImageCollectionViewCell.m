//
//  LNFeedImageCollectionViewCell.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/1.
//

#import "LNFeedImageCollectionViewCell.h"

@implementation LNFeedImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

@end
