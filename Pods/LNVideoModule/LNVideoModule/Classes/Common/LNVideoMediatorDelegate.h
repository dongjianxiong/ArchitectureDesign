//
//  LNVideoMediatorDelegate.h
//  LNVideoModule
//
//  Created by Lenny on 2022/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LNVideoMediatorDelegate <NSObject>

- (UIViewController *)getPayerViewControllerWithUrlStr:(NSString *)urlStr;

- (UIViewController *)getRecommendTableViewController;

- (UIViewController *)getFocusTableViewController;

@end

NS_ASSUME_NONNULL_END
