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

@interface LNFeedTableViewCell ()<UITextViewDelegate>

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
    textView.font = UIFontProvider.systemFont14;
    textView.textColor = [UIColor blackColor];
    textView.backgroundColor = [UIColor yellowColor];
    return textView;
}

#pragma  mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return true;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
{
    if ([[URL scheme] isEqualToString:@"topic"]) {
        NSString *topicId = [[URL absoluteString] substringFromIndex:8];
        NSString *topicName = [textView.text substringWithRange:characterRange];
        NSLog(@"topicName:%@", topicName);
        [self clickOnTopic:topicId];
        return NO;
    }
    else if ([[URL scheme] isEqualToString:@"user"]) {
        NSString *userId = [[URL absoluteString] substringFromIndex:7];
        NSString *userName = [textView.text substringWithRange:characterRange];
        NSLog(@"userName:%@", userName);
        [self clickOnUser:userId];
        return NO;
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
{
    return YES;
}

- (void)clickOnTopic:(NSString *)topicId
{
    NSLog(@"topicId:%@", topicId);
}

- (void)clickOnUser:(NSString *)userId
{
    NSLog(@"userId:%@", userId);
}

@end
