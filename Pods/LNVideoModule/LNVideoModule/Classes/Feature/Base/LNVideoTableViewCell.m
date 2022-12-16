//
//  LNVideoTableViewCell.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/10.
//

#import "LNVideoTableViewCell.h"
#import "LNVideoPlayer.h"
#import "LNVideoModel.h"
#import <SDWebImage/SDWebImage.h>

@interface LNVideoTableViewCell ()

@property(nonatomic, strong) UIImageView *userIcon;

@property(nonatomic, strong) UILabel *userNameLabel;

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) LNVideoPlayer *player;

@property(nonatomic, strong) UILabel *timeIntervalLabel;

@property(nonatomic, strong) UILabel *createTimeLabel;

@property(nonatomic, strong) UILabel *viewTimesLabel;

@property(nonatomic, strong) UIButton *focusButton;
@property(nonatomic, strong) UIButton *commentButton;
@property(nonatomic, strong) UIButton *moreButton;


@end

@implementation LNVideoTableViewCell

#pragma mark - LNCustomViewAdaptor

- (void)reloadWithData:(LNVideoModel *)data
{
    self.titleLabel.text = data.title;
    [self.player playWithUrlStr:data.url coverImage:data.coverUrl];
    self.timeIntervalLabel.text = [data timeIntervalToTimeString];
    self.createTimeLabel.text = [data createTimeToTimeString];
    
    [self.userIcon sd_setImageWithURL:[data.creator iconRealUrl]];
    self.userNameLabel.text = data.creator.name;
    
    [self updateSubviewsLayout];

}

- (void)addSubviews
{
    [self.contentView addSubview:self.player];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeIntervalLabel];

    [self.contentView addSubview:self.userIcon];
    [self.contentView addSubview:self.userNameLabel];
    
    [self updateSubviewsLayout];
    [self updateSubviewsStyle];
}

- (void)updateSubviewsLayout
{
    self.player.frame = CGRectMake(0, 0, LN_SCREEN_WIDTH, 200);
    self.titleLabel.frame = CGRectMake(0, 0, LN_SCREEN_WIDTH, 40);
    self.timeIntervalLabel.frame = CGRectMake(LN_SCREEN_WIDTH- 110, LN_SCREEN_HEIGHT - 100, 100, 40);
    
    self.userIcon.frame = CGRectMake(20, self.player.frame.size.height + 10, 40, 40);
    self.userIcon.clipsToBounds = YES;
    self.userIcon.layer.cornerRadius =  20;
    
    self.userNameLabel.frame = CGRectMake(self.userIcon.frame.size.width + 25, self.player.frame.size.height + 10, 100, 40);
}

- (void)updateSubviewsStyle
{
    _player.backgroundColor = [UIColor blueColor];
    
    _titleLabel.font = [LNVideoTableViewCell titleFont];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _timeIntervalLabel.font = [LNVideoTableViewCell timeIntervalFont];
    _timeIntervalLabel.textColor = [UIColor lightGrayColor];
    
    _createTimeLabel.font = [LNVideoTableViewCell userNameFont];
    _createTimeLabel.textColor = [UIColor lightGrayColor];
    
    _userNameLabel.font = [LNVideoTableViewCell userNameFont];
    _userNameLabel.textColor = [UIColor grayColor];
}

#pragma mark - subviews create
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UILabel *)timeIntervalLabel
{
    if (!_timeIntervalLabel) {
        _timeIntervalLabel = [[UILabel alloc] init];
    }
    return _timeIntervalLabel;
}

- (UILabel *)createTimeLabel
{
    if (!_createTimeLabel) {
        _createTimeLabel = [[UILabel alloc] init];
    }
    return _createTimeLabel;
}

- (LNVideoPlayer *)player
{
    if (!_player) {
        _player = [[LNVideoPlayer alloc] initWithFrame:CGRectMake(0, 0, LN_SCREEN_WIDTH, 200)];
    }
    return _player;
}

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
static UIFont *_timeIntervalFont = nil;
static UIFont *_createTimeFont = nil;
static UIFont *_titleFont = nil;

+ (UIFont *)userNameFont
{
    if (!_userNameFont) {
        _userNameFont = [UIFont systemFontOfSize:14];
    }
    return _userNameFont;
}

+ (UIFont *)timeIntervalFont
{
    if (!_timeIntervalFont) {
        _timeIntervalFont = [UIFont systemFontOfSize:10];
    }
    return _timeIntervalFont;
}

+ (UIFont *)createTimeFont
{
    if (!_createTimeFont) {
        _createTimeFont = [UIFont systemFontOfSize:10];
    }
    return _createTimeFont;
}

+ (UIFont *)titleFont
{
    if (!_titleFont) {
        _titleFont = [UIFont systemFontOfSize:16];
    }
    return _titleFont;
}

@end
