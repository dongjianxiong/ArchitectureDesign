//
//  LNFeedTableViewCell.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "LNFeedTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "LNUser.h"
#import "LNUIKitHelper.h"
#import "LNTopic.h"

@interface LNFeedTableViewCell ()<UITextViewDelegate, LNFeedInfoViewEventDelegate>

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
    self.timeLabel.text = feedLayout.createTimeStr;
    [self updateSubviewsLayout];
}

- (void)updateSubviewsLayout
{
    self.contentLabel.frame = _feedLayout.contentFrame;
    self.forwardFeedLabel.frame = _feedLayout.forwardFeedFrame;
    self.timeLabel.frame = _feedLayout.createTimeFrame;
    CGRect infoFrame = self.infoView.frame;
    infoFrame.origin.x = [UIScreen width] - 220;
    infoFrame.origin.y = _feedLayout.cellHeight - 50;
    self.infoView.frame = infoFrame;
}

- (void)updateSubviewsStyle
{
    
}

- (LNFeedInfoView *)infoView
{
    if (!_infoView) {
        LNFeedInfoView *view = [[LNFeedInfoView alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
        _infoView = view;
        _infoView.delegate = self;
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
        [self.contentView addSubview:_userPortrait];
    }
    return _userPortrait;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 20, 200, 40)];
        _userNameLabel.font = [UIFont systemFontOfSize17];
        _userNameLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_userNameLabel];
    }
    return _userNameLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.font = [UIFont systemFontOfSize17];
        _timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}


- (UITextView *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [self commonTextView];
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

- (UITextView *)forwardFeedLabel
{
    if (!_forwardFeedLabel) {
        _forwardFeedLabel = [self commonTextView];
        _forwardFeedLabel.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_forwardFeedLabel];
    }
    return _forwardFeedLabel;
}

- (UITextView *)commonTextView
{
    UITextView *textView = [[UITextView alloc] init];
    textView.delegate = self;
    textView.scrollEnabled = NO;
    textView.editable = NO;
    textView.textContainerInset = UIEdgeInsetsZero;
    textView.textContainer.lineFragmentPadding = 0;
//        _forwardFeedLabel.textStorage
//        _forwardFeedLabel.numberOfLines = 0;
//        _forwardFeedLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    textView.font = [UIFont systemFontOfSize17];
    textView.textColor = [UIColor blackColor];
    return textView;
}

#pragma  mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return NO;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
API_AVAILABLE(ios(10.0)){
    if ([[URL scheme] isEqualToString:@"topic"]) {
        NSString *topicId = [[URL absoluteString] substringFromIndex:8];
        [self clickOnTopic:topicId];
        return NO;
    }
    else if ([[URL scheme] isEqualToString:@"user"]) {
        NSString *userId = [[URL absoluteString] substringFromIndex:7];
        [self clickOnUser:userId];
        return NO;
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
API_AVAILABLE(ios(10.0)){
    return YES;
}

- (void)clickOnTopic:(NSString *)topicId
{
    LNTopic *selectedTopic = nil;
    for (LNTopic *topic in self.feedLayout.feed.topics) {
        if ([topic.topicId isEqualToString:topicId]) {
            selectedTopic = topic;
            break;;
        }
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(feedView:clickOnTopic:)]) {
        [self.delegate feedView:self clickOnTopic:selectedTopic];
    }
}

- (void)clickOnUser:(NSString *)userId
{
    LNUser *selectedUser = self.feedLayout.feed.creator;
    if (self.delegate && [self.delegate respondsToSelector:@selector(feedView:clickOnTopic:)]) {
        [self.delegate feedView:self clickOnUser:selectedUser];
    }
}

#pragma mark -

- (void)feedInfoView:(LNFeedInfoView *)infoView
   clickeOnLikeButton:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(feedView:clickOnLikeFeed:isLike:)]) {
        [self.delegate feedView:self clickOnLikeFeed:self.feedLayout.feed isLike:YES];
    }
}

- (void)feedInfoView:(LNFeedInfoView *)infoView
  clickeOnStoreButton:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(feedView:clickOnStoreFeed:isStore:)]) {
        [self.delegate feedView:self clickOnStoreFeed:self.feedLayout.feed isStore:YES];
    }
}

- (void)feedInfoView:(LNFeedInfoView *)infoView
clickeOnCommentButton:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(feedView:clickOnCommentFeed:)]) {
        [self.delegate feedView:self clickOnCommentFeed:self.feedLayout.feed];
    }
}


@end
