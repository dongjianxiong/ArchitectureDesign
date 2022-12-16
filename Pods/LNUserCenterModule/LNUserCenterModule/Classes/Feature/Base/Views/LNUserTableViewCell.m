//
//  LNUserTableViewCell.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/10.
//

#import "LNUserTableViewCell.h"
#import "LNUserModel.h"
#import <SDWebImage/SDWebImage.h>

@interface LNUserTableViewCell ()

@property(nonatomic, strong) UIImageView *userIcon;

@property(nonatomic, strong) UILabel *userNameLabel;


@end

@implementation LNUserTableViewCell

#pragma mark - LNCustomViewAdaptor

- (void)reloadWithData:(LNUserModel *)data
{
    [self.userIcon sd_setImageWithURL:[data iconRealUrl]];
    self.userNameLabel.text = data.name;
    
    [self updateSubviewsLayout];

}

- (void)addSubviews
{
    [self.contentView addSubview:self.userIcon];
    [self.contentView addSubview:self.userNameLabel];
    
    [self updateSubviewsLayout];
    [self updateSubviewsStyle];
}

- (void)updateSubviewsLayout
{
    self.userIcon.frame = CGRectMake(20, 10, 40, 40);
    self.userIcon.clipsToBounds = YES;
    self.userIcon.layer.cornerRadius =  20;
    
    self.userNameLabel.frame = CGRectMake(self.userIcon.frame.size.width + 25, 10, 100, 40);
}

- (void)updateSubviewsStyle
{
    _userNameLabel.font = [LNUserTableViewCell userNameFont];
    _userNameLabel.textColor = [UIColor grayColor];
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

static UIFont *_userNameFont = nil;

+ (UIFont *)userNameFont
{
    if (!_userNameFont) {
        _userNameFont = [UIFont systemFontOfSize:14];
    }
    return _userNameFont;
}

@end
