//
//  NSString+LNTimeFormat.m
//  LGVideo
//
//  Created by LG on 2018/5/20.
//  Copyright © 2018 LG. All rights reserved.
//

#import "NSString+LNTimeFormat.h"

@implementation NSString (LNTimeFormat)

+ (instancetype)timeformatFromSeconds:(NSTimeInterval)seconds {
    int minute = (int)seconds/60;
    int second = (int)seconds%60;
    if (minute < 100) {
        NSString *time = [NSString stringWithFormat:@"%.2d:%.2d", minute, second];
        return time;
    } else {
        NSString *time = [NSString stringWithFormat:@"%d:%.2d", minute, second];
        return time;
    }
}

+ (NSString *)timeformatFromSeconds:(NSTimeInterval)seconds
                         formatType:(LNTimeFormatType)type
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];

    //时间戳转时间的方法
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSString *TimeStr = [formatter stringFromDate:date];
    return TimeStr;
}



@end
