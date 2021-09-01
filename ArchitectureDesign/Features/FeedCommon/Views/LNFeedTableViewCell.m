//
//  LNFeedTableViewCell.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNFeedTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "LNUser.h"
#import "LNCusomUIKitHelper.h"

@interface LNFeedTableViewCell ()

@end

@implementation LNFeedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.commentCountLabel = [];
    }
    return self;
}

- (void)reloadWithData:(LNFeedCellLayout *)feedLayout
{
    _feedLayout = feedLayout;
    [self.infoView reloadWithData:feedLayout.feed];
    
    [self.userPortrait sd_setImageWithURL:[NSURL URLWithString:feedLayout.feed.creator.portraitUrl]];
    self.userNameLabel.text = feedLayout.feed.creator.name;
    
    self.contentLabel.attributedText = feedLayout.feedContent;
    self.forwardFeedLabel.attributedText = feedLayout.forwardFeedContent;
    [self updatelayout];
}

- (void)updatelayout
{
    self.contentLabel.frame = _feedLayout.contentFrame;
    self.forwardFeedLabel.frame = _feedLayout.forwordFeedFrame;
    CGRect infoFrame = self.infoView.frame;
    infoFrame.origin.x = LNUIScreenWidth - 220;
    infoFrame.origin.y = _feedLayout.cellHeight - 50;
    self.infoView.frame = infoFrame;
    
}

- (void)updateStyle
{
    
}

- (LNFeedInfoView *)infoView
{
    if (!_infoView) {
        LNFeedInfoView *view = [[LNFeedInfoView alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
        _infoView.backgroundColor = [UIColor redColor];
        _infoView = view;
        [self.contentView addSubview:_infoView];
    }
    return _infoView;
}

- (UIImageView *)userPortrait
{
    if (!_userPortrait) {
        _userPortrait = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
        _userPortrait.layer.cornerRadius = 20;
        _userPortrait.layer.masksToBounds = true;
        _userPortrait.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_userPortrait];
    }
    return _userPortrait;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 20, 200, 40)];
        _userNameLabel.font = UIFontProvider.systemFont15;
        _userNameLabel.backgroundColor = [UIColor grayColor];
        _userNameLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_userNameLabel];
    }
    return _userNameLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _contentLabel.font = UIFontProvider.systemFont14;
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

- (UILabel *)forwardFeedLabel
{
    if (!_forwardFeedLabel) {
        _forwardFeedLabel = [[UILabel alloc] init];
        _forwardFeedLabel.numberOfLines = 0;
        _forwardFeedLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _forwardFeedLabel.font = UIFontProvider.systemFont14;
        _forwardFeedLabel.textColor = [UIColor blackColor];
        _forwardFeedLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_forwardFeedLabel];
    }
    return _forwardFeedLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
