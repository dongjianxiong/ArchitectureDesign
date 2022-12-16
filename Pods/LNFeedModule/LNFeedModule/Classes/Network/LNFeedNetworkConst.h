//
//  LNFeedNetworkConst.h
//  LNFeedModule
//
//  Created by Lenny on 2022/12/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NSString *LNHTTPRequestPathString NS_STRING_ENUM;

FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedRecommendsPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedTimelinesPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedFocusFeedsPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedDetailPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedTopicsPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedTopicFeedsPath;
FOUNDATION_EXPORT LNHTTPRequestPathString const LNFeedCommentsPath;



@interface LNFeedNetworkConst : NSObject

@end

NS_ASSUME_NONNULL_END
