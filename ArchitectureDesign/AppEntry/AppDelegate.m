//
//  AppDelegate.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/30.
//

#import "AppDelegate.h"
#import <LNCommonKit/LNBaseMVC.h>
#import "LNMainViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *info = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    LNMainViewController *mainVc = [[LNMainViewController alloc] init];
    LNBaseNavigationController *rootVc = [[LNBaseNavigationController alloc] initWithRootViewController:mainVc];
    self.window.rootViewController = rootVc;
    
//    NSString *hostUrl = info[@"HOST_URL"];
    // Override point for customization after application launch.
    return YES;
}

@end
