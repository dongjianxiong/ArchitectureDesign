//
//  LNFeedInfoView.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import "LNFeedInfoView.h"

@implementation LNFeedInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubviews];
        [self updateSubviewsLayout];
    }
    return self;
}

- (void)creatSubviews
{
    self.likeCountLabel = [self createCommonLabel];
    self.commentCountLabel = [self createCommonLabel];
    self.storeCountLabel = [self createCommonLabel];
    
    self.likeImageView = [self createCommonImageView];
    self.storeImageView = [self createCommonImageView];
    self.commentImageView = [self createCommonImageView];
}

- (UILabel *)createCommonLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    label.backgroundColor = [UIColor greenColor];
    [self addSubview:label];
    return label;
}

- (UIImageView *)createCommonImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.backgroundColor = [UIColor redColor];
    imageView.layer.cornerRadius = 4;
    imageView.layer.masksToBounds = YES;
    [self addSubview:imageView];
    return imageView;
}

- (void)updateSubviewsLayout
{
    CGFloat hSpaceOfLabel = 5;//横向间距
    CGFloat vSpace = 2;//纵向间距
    CGFloat count = 3;//列数
    CGFloat labelWidth = (self.frame.size.width - (count - 1)*hSpaceOfLabel)/count;
    CGFloat labelHeigth = 10;
    CGFloat imageWidth = self.frame.size.height - vSpace;
//    CGFloat hSpaceOfImage = hSpaceOfLabel;
    if (imageWidth > labelWidth) {
        imageWidth = labelWidth;
    }
    
    for (NSInteger i = 0; i < count; i++) {
        CGFloat xOfLabel = i*(hSpaceOfLabel + labelWidth);
        CGFloat xOfImage = xOfLabel + (labelWidth - imageWidth)/2;
        switch (i) {
            case 0:
                self.likeCountLabel.frame = CGRectMake(xOfLabel, 0, labelWidth, labelHeigth);
                self.likeImageView.frame = CGRectMake(xOfImage, vSpace+labelHeigth, imageWidth, imageWidth);
                break;
            case 1:
                self.commentCountLabel.frame = CGRectMake(xOfLabel, 0, labelWidth, labelHeigth);
                self.commentImageView.frame = CGRectMake(xOfImage, vSpace+labelHeigth, imageWidth, imageWidth);
                break;
            case 2:
                self.storeCountLabel.frame = CGRectMake(xOfLabel, 0, labelWidth, labelHeigth);
                self.storeImageView.frame = CGRectMake(xOfImage, vSpace+labelHeigth, imageWidth, imageWidth);
                break;
            default:
                break;
        }
    }
}

- (void)reloadWithData:(LNFeed *)feedModel
{
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@",@(feedModel.likeCount)];
    self.commentCountLabel.text = [NSString stringWithFormat:@"%@",@(feedModel.commentCount)];
    self.storeCountLabel.text = [NSString stringWithFormat:@"%@",@(feedModel.storeCount)];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
