//
//  LNTopic.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LNUser;
@interface LNTopic : NSObject

@property(nonatomic, copy) NSString *topicId;

@property(nonatomic, copy) NSString *name;


@end

NS_ASSUME_NONNULL_END
