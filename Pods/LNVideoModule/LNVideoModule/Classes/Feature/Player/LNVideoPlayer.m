//
//  LNVideoPlayer.m
//  LNVideoModule
//
//  Created by Lenny on 2022/12/9.
//

#import "LNVideoPlayer.h"
#import <SDWebImage/SDWebImage.h>

@interface LNVideoPlayer ()

@property(nonatomic, strong) UIImageView *coverImageView;

@end

@implementation LNVideoPlayer

- (instancetype)initWithUrlStr:(NSString *)urlStr coverImage:(NSString *)coverUrl;
{
    self = [super init];
    if (self) {
        [self playWithUrlStr:urlStr coverImage:coverUrl];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.coverImageView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.coverImageView];
    }
    return self;
}

- (void)playWithUrlStr:(NSString *)urlStr coverImage:(NSString *)coverUrl
{
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:coverUrl]];
}

- (UIImageView *)coverImageView
{
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaultName"]];
        _coverImageView.frame = self.bounds;
    }
    return _coverImageView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
