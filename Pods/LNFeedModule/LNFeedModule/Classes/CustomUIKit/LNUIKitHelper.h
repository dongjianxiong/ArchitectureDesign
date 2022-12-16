//
//  LNUIKitHelper.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/2.
//

#ifndef LNUIKitHelper_h
#define LNUIKitHelper_h

#import "UIScreen+LNUIKit.h"
#import "UIFont+LNAddition.h"

#define LNThemeBackgroundColor      [UIColor colorWithHexString:@"0E121B"]
#define LNThemeForegroundColor      [UIColor colorWithHexString:@"FCCA07"]
#define LNScreenWidth               [UIScreen mainScreen].bounds.size.width
#define LNScreenHeight              [UIScreen mainScreen].bounds.size.height
#define LNMaxScreenWidth            MAX(LGScreenWidth, LNScreenHeight)
#define LNMinScreenHeight           MIN(LGScreenWidth, LNScreenHeight)
#define LNIsiPhoneX                 (LNMaxScreenWidth >= 812 ? YES : NO)
#define LNNavigationBarHeight       (LNIsiPhoneX ? 88 : 64)
#define LNTabbarHeight              (LNIsiPhoneX ? 83 : 49)
#define LNStatusBarHeight           (LNIsiPhoneX ? 44 : 20)
#define LNBottomBarHeight           (LNIsiPhoneX ? 20 : 0)


#endif /* LNUIKitHelper_h */
