//
//  LNMediator.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNMediator.h"

@implementation LNMediator

+ (UIViewController *)topViewController:(UIViewController *)vc {
    if (vc.presentedViewController) {
        return [LNMediator topViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController *svc = (UISplitViewController*)vc;
        if (svc.viewControllers.count > 0) {
            return [LNMediator topViewController:svc.viewControllers.lastObject];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navC = (UINavigationController*)vc;
        if (navC.viewControllers.count > 0) {
            return [LNMediator topViewController:navC.topViewController];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabC = (UITabBarController*)vc;
        if (tabC.viewControllers.count > 0) {
            return [LNMediator topViewController:tabC.selectedViewController];
        } else {
            return vc;
        }
    } else {
        return vc;
    }
}

+ (UIViewController *)currentViewController {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = [LNMediator topViewController:keyWindow.rootViewController];
    return vc;
}

@end
