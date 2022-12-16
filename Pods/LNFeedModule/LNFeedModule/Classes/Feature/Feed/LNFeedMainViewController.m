//
//  LNFeedMainViewController.m
//  LNFeedModule
//
//  Created by Lenny on 2021/10/24.
//

#import "LNFeedMainViewController.h"
#import "LNFeedModelConfig.h"



@interface LNFeedMainViewController ()

@property(nonatomic, assign) BOOL animating;

@property(nonatomic, strong, readwrite) id<LNFeedMediatorDelegate> mediator;

@end

@implementation LNFeedMainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (id<LNFeedMediatorDelegate>)mediator
{
    if (!_mediator) {
        _mediator = [LNFeedModelConfig feeMediator];
    }
    return _mediator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIViewController *feedVC1 = [self.mediator createFeedRecommendVC];
    [self.recommendBgView addSubview:feedVC1.view];
    [self addChildViewController:feedVC1];
    
    UIViewController *feedVC2 = [self.mediator createFeedTimeLineVC];
    [self.timeLineBgView addSubview:feedVC2.view];
    [self addChildViewController:feedVC2];
    
    UIViewController *feedVC3 = [self.mediator createFeedFocusVC];
    [self.focusBgView addSubview:feedVC3.view];
    [self addChildViewController:feedVC3];
        
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectedAtSegment:(UISegmentedControl *)sender {
    
    if (self.animating) {
        return;
    }
    self.animating = YES;
    CGPoint offset = self.containorView.contentOffset;
    offset.x = sender.selectedSegmentIndex * (LN_SCREEN_WIDTH + 20);//self.containorView.frame.size.width + 10;
    [self.containorView setContentOffset:offset animated:YES];
    self.animating = NO;
}


@end
