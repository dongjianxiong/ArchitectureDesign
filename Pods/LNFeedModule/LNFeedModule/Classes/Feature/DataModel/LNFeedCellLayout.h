//
//  LNFeedCellLayout.h
//  ArchitectureDesign
//
//  Created by Lenny on 2021/8/31.
//

#import <UIKit/UIKit.h>
#import "LNFeed.h"

extern CGFloat const LNFeedCellCententOffsetX;
//extern CGFloat const LNFeedCellCententOffsetX;
//extern CGFloat const LNFeedCellCententOffsetX;
//extern CGFloat const LNFeedCellCententOffsetX;
//extern CGFloat const LNFeedCellCententOffsetX;
//extern CGFloat const LNFeedCellCententOffsetX;

NS_ASSUME_NONNULL_BEGIN

@interface LNFeedCellLayout : NSObject

@property(nonatomic, strong) LNFeed *feed;

@property(nonatomic, assign) CGFloat marginY;

@property(nonatomic, assign) CGFloat commonMarginX;

@property(nonatomic, assign) CGFloat forwardOffsetX;

@property(nonatomic, assign) CGFloat imageSpace;

@property(nonatomic, assign) CGFloat  cellHeight;

@property(nonatomic, assign) CGRect  contentFrame;

@property(nonatomic, assign) CGRect  imageCollectFrame;

@property(nonatomic, assign) CGRect  forwardFeedFrame;

@property(nonatomic, assign) CGRect  createTimeFrame;

@property(nonatomic, strong) NSAttributedString *feedContent;

@property(nonatomic, strong) NSAttributedString *forwardFeedContent;

@property(nonatomic, copy) NSString *createTimeStr;


@end

NS_ASSUME_NONNULL_END
