//
//  LNUserModel.h
//  LNUserCenterModule
//
//  Created by Lenny on 2022/12/11.
//

#import <LNCommonKit/LNCommonKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNUserModel : LNBaseModel

@property(nonatomic, copy) NSString *userId;

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *iconUrl;

- (NSURL *)iconRealUrl;

@end

NS_ASSUME_NONNULL_END
