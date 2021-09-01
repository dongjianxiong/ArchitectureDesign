//
//  LNStyleManager.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

#define UIFontProvider [LNStyleManager sharedManager]

@interface LNStyleManager : NSObject

@property(nonatomic, strong) UIFont *systemFont15;
@property(nonatomic, strong) UIFont *systemFont14;
@property(nonatomic, strong) UIFont *systemFont13;
@property(nonatomic, strong) UIFont *systemFont12;
@property(nonatomic, strong) UIFont *systemFont11;
@property(nonatomic, strong) UIFont *systemFont10;
@property(nonatomic, strong) UIFont *systemFont9;
@property(nonatomic, strong) UIFont *systemFont8;

+ (LNStyleManager *)sharedManager;

@end


NS_ASSUME_NONNULL_END
