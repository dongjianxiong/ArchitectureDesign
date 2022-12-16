//
//  LNLiveMediatorDelegate.h
//  LNLiveModule
//
//  Created by Lenny on 2022/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LNLiveMediatorDelegate <NSObject>


- (UIViewController *)getRecommendTableViewController;

- (UIViewController *)getFocusTableViewController;

- (UIViewController *)getTimeLineListViewController;

- (UIViewController *)getLiveRoomViewControllerWithRoomId:(NSString *)roomId;

- (UIViewController *)getLiveAnchorViewControllerWithUserId:(NSString *)userId;

@end

NS_ASSUME_NONNULL_END
