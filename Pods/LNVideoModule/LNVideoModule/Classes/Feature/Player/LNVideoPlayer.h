//
//  LNVideoPlayer.h
//  LNVideoModule
//
//  Created by Lenny on 2022/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNVideoPlayer : UIView

- (instancetype)initWithUrlStr:(NSString *)urlStr coverImage:(NSString *)coverUrl;
- (void)playWithUrlStr:(NSString *)urlStr coverImage:(NSString *)coverUrl;

@end

NS_ASSUME_NONNULL_END
