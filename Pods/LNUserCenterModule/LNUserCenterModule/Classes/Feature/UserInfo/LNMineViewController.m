//
//  LNMineViewController.m
//  AFNetworking
//
//  Created by Lenny on 2022/12/11.
//

#import "LNMineViewController.h"
#import "LNUserInfoView.h"
#import "LNUserCenterModuleConfig.h"
#import "LNUserModel.h"
#import "LNUserInfoProvider.h"

@interface LNMineViewController ()

@property (nonatomic, strong) LNUserInfoView *userInfoView;

@property (nonatomic, strong) UIView *userListBgView;

@property (nonatomic, strong) LNUserInfoProvider *provider;

@end

@implementation LNMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.userInfoView];
    [self.view addSubview:[self lineView]];
    [self.view addSubview:self.userListBgView];
    
    UIViewController *vc = [LNUserCenterModuleConfig.mediator getFriendTableViewController];
    [self addChildViewController:vc];
    [self.userListBgView addSubview:vc.view];
    
    [self updateUserInfo];
    
    // Do any additional setup after loading the view.
}

- (void)updateUserInfo
{
    __weak typeof(self) weakSelf = self;
    self.provider = [LNUserInfoProvider loadWithCreator:^(LNUserInfoProvider * _Nonnull provider) {
    } success:^(id  _Nullable data) {
        [weakSelf.userInfoView reloadWithData:data];
    } failure:^(NSString * _Nullable errMsg) {
        LNUserModel *user = [[LNUserModel alloc] init];
        user.name = @"名字";
        user.iconUrl = @"https://t7.baidu.com/it/u=2582370511,530426427&fm=193&f=GIF";
        [weakSelf.userInfoView reloadWithData:user];
    }];
    

    
}


- (LNUserInfoView *)userInfoView
{
    if (!_userInfoView) {
        _userInfoView = [[LNUserInfoView alloc] initWithFrame:CGRectMake(0, 0, LN_SCREEN_WIDTH, 250)];
    }
    return _userInfoView;
}

- (UIView *)lineView
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.userInfoView.frame.size.height, LN_SCREEN_WIDTH, 1)];
    line.backgroundColor = [UIColor blackColor];
    return line;
}

- (UIView *)userListBgView
{
    if (!_userListBgView) {
        _userListBgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.userInfoView.frame.size.height + 1, LN_SCREEN_WIDTH, LN_SCREEN_HEIGHT - self.userInfoView.frame.size.height - 1)];
    }
    return _userListBgView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
