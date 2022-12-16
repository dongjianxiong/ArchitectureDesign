//
//  UIFont+LNAddition.m
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/2.
//

#import "UIFont+LNAddition.h"

//UIFont const *LNSystemFont23;
//UIFont const *LNSystemFont20;
//UIFont const *LNSystemFont18;
//UIFont const *LNSystemFont17;
//UIFont const *LNSystemFont16;
//UIFont const *LNSystemFont15;
//UIFont const *LNSystemFont14;
//UIFont const *LNSystemFont13;
//UIFont const *LNSystemFont12;

@implementation UIFont (LNAddition)

static UIFont *LNSystemFont23 = nil;
static UIFont *LNSystemFont20 = nil;
static UIFont *LNSystemFont18 = nil;
static UIFont *LNSystemFont17 = nil;
static UIFont *LNSystemFont16 = nil;
static UIFont *LNSystemFont15 = nil;
static UIFont *LNSystemFont14 = nil;
static UIFont *LNSystemFont13 = nil;
static UIFont *LNSystemFont12 = nil;

+ (const UIFont *)systemFontOfSize23
{
    if (!LNSystemFont23) {
        LNSystemFont23 = [UIFont systemFontOfSize:23];
    }
    return LNSystemFont23;
}

+ (UIFont *)systemFontOfSize20
{
    if (!LNSystemFont20) {
        LNSystemFont20 = [UIFont systemFontOfSize:20];
    }
    return LNSystemFont20;
}

+ (UIFont *)systemFontOfSize18
{
    if (!LNSystemFont18) {
        LNSystemFont18 = [UIFont systemFontOfSize:18];
    }
    return LNSystemFont18;
}

+ (UIFont *)systemFontOfSize17
{
    if (!LNSystemFont17) {
        LNSystemFont17 = [UIFont systemFontOfSize:17];
    }
    return LNSystemFont17;
}

+ (UIFont *)systemFontOfSize16
{
    if (!LNSystemFont16) {
        LNSystemFont16 = [UIFont systemFontOfSize:16];
    }
    return LNSystemFont16;
}

+ (UIFont *)systemFontOfSize15
{
    if (!LNSystemFont15) {
        LNSystemFont15 = [UIFont systemFontOfSize:15];
    }
    return LNSystemFont15;
}

+ (UIFont *)systemFontOfSize14
{
    if (!LNSystemFont14) {
        LNSystemFont14 = [UIFont systemFontOfSize:14];
    }
    return LNSystemFont14;
}

+ (UIFont *)systemFontOfSize13
{
    if (!LNSystemFont13) {
        LNSystemFont13 = [UIFont systemFontOfSize:13];
    }
    return LNSystemFont13;
}

+ (UIFont *)systemFontOfSize12
{
    if (!LNSystemFont12) {
        LNSystemFont12 = [UIFont systemFontOfSize:12];
    }
    return LNSystemFont12;
}



@end
