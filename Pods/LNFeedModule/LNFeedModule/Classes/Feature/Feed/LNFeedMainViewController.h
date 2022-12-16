//
//  LNFeedMainViewController.h
//  LNFeedModule
//
//  Created by Lenny on 2021/10/24.
//

#import <UIKit/UIKit.h>
#import "LNBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LNFeedMainViewController : LNBaseViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (weak, nonatomic) IBOutlet UIScrollView *containorView;
@property (weak, nonatomic) IBOutlet UIView *recommendBgView;
@property (weak, nonatomic) IBOutlet UIView *timeLineBgView;

@property (weak, nonatomic) IBOutlet UIView *focusBgView;

- (IBAction)selectedAtSegment:(UISegmentedControl *)sender;

@end

NS_ASSUME_NONNULL_END
