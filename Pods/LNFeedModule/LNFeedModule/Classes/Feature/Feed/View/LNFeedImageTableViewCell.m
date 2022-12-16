//
//  LNFeedImageTableViewCell.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/1.
//

#import "LNFeedImageTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "LNUser.h"
#import "LNFeedImageCollectionViewCell.h"
#import "LNUIKitHelper.h"

@interface LNFeedImageTableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation LNFeedImageTableViewCell

- (void)updateSubviewsLayout
{
    [super updateSubviewsLayout];
    self.imageColectionView.frame = self.feedLayout.imageCollectFrame;
    [self.imageColectionView reloadData];
}


- (UICollectionView *)imageColectionView
{
    if (!_imageColectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 3;
        layout.minimumInteritemSpacing = 4;
        layout.itemSize = CGSizeMake(([UIScreen width] - 30 - 10)/3, (LNUIScreenWidth - 30 - 10)/3);
        _imageColectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_imageColectionView registerClass:[LNFeedImageCollectionViewCell class] forCellWithReuseIdentifier:@"LNFeedImageCollectionViewCell"];
        _imageColectionView.delegate = self;
        _imageColectionView.dataSource = self;
        _imageColectionView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_imageColectionView];
    }
    return _imageColectionView;
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.feedLayout.feed.imageUrls.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"LNFeedImageCollectionViewCell";
    LNFeedImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:self.feedLayout.feed.imageUrls[indexPath.row]];
//    cell.contentView.backgroundColor = [UIColor redColor];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
