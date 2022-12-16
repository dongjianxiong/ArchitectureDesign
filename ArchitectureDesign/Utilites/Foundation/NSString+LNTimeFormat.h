//
//  NSString+LNTimeFormat.h
//  LGVideo
//
//  Created by LG on 2018/5/20.
//  Copyright © 2018 LG. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LNTimeFormatTypeCN_YMdHms,//YYYY年MM月dd日 HH时mm分ss秒
    LNTimeFormatTypeCN_YMd,//YYYY年MM月dd日
    LNTimeFormatTypeCN_Hms,//HH时mm分ss秒
    LNTimeFormatTypeSlash_YMdHms,//YYYY/MM/dd HH:mm:ss
    LNTimeFormatTypeSlash_YMd,//YYYY/MM/dd
    LNTimeFormatTypeBar_YMdHms,//YYYY-MM-dd HH:mm:ss
    LNTimeFormatTypeBar_YMd,//YYYY-MM-dd
    LNTimeFormatType_Hms,//HH:mm:ss
} LNTimeFormatType;

@interface NSString (LNTimeFormat)

+ (instancetype)timeformatFromSeconds:(NSTimeInterval)seconds;

+ (NSString *)timeformatFromSeconds:(NSTimeInterval)seconds
                         formatType:(LNTimeFormatType)type;

@end
