//
//  LNTopicFeedListProvider.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/9/3.
//

#import "LNBaseFeedListProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNTopicFeedListProvider : LNBaseFeedListProvider

- (instancetype)initWithTopicId:(NSString *)topicId;

@property (nonatomic, copy) NSString *topicId;

@end

NS_ASSUME_NONNULL_END
