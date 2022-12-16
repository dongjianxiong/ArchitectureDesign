//
//  LNUserCenterMediatorDelegate.h
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LNUserCenterMediatorDelegate <NSObject>


- (UIViewController *)getMineViewController;

- (UIViewController *)getUserCenterViewControllerWithUserId:(NSString *)userId;

- (UIViewController *)getFriendTableViewController;

- (UIViewController *)getFansTableViewController;

- (UIViewController *)getFocusTableViewController;

@end

NS_ASSUME_NONNULL_END
