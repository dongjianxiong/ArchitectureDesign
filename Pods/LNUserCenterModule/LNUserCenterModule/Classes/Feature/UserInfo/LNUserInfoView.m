//
//  LNUserInfoView.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/11.
//

#import "LNUserInfoView.h"
#import <SDWebImage/SDWebImage.h>
#import "LNUserModel.h"

@interface LNUserInfoView ()

@property(nonatomic, strong) UIImageView *userIcon;

@property(nonatomic, strong) UILabel *userNameLabel;



@end

@implementation LNUserInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}

#pragma mark - LNCustomViewAdaptor


- (void)reloadWithData:(LNUserModel *)data
{
    [self.userIcon sd_setImageWithURL:[data iconRealUrl]];
    self.userNameLabel.text = data.name;
    
    [self updateSubviewsLayout];

}

- (void)addSubviews
{
    [self addSubview:self.userIcon];
    [self addSubview:self.userNameLabel];
    
    [self updateSubviewsLayout];
    [self updateSubviewsStyle];
}

- (void)updateSubviewsLayout
{
    self.userIcon.frame = CGRectMake((self.frame.size.width - 120)/2, self.frame.size.height/2-80, 120, 120);
    self.userIcon.clipsToBounds = YES;
    self.userIcon.layer.cornerRadius =  20;
    
    self.userNameLabel.frame = CGRectMake(0, self.userIcon.frame.size.height + self.userIcon.frame.origin.y + 5, self.frame.size.width, 40);
}

- (void)updateSubviewsStyle
{
    _userNameLabel.font = [UIFont systemFontOfSize:16];
    _userNameLabel.textColor = [UIColor grayColor];
    _userNameLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - subviews create

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
    }
    return _userNameLabel;
}

- (UIImageView *)userIcon
{
    if (!_userIcon) {
        _userIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaultName"]];
    }
    return _userIcon;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
