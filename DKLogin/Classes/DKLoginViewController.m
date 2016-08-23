//
//  DKLoginViewController.m
//  DKLoginConfig
//
//  Created by NaCai on 16/8/19.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import "DKLoginViewController.h"
#import "DKLoginViewModel.h"
#import "DKLoginView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface DKLoginViewController ()
@property(nonatomic, strong) DKLoginViewModel *mainViewModel;
@property(nonatomic, strong) DKLoginView *mainView;
@end

@implementation DKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewAndViewModel];
}

- (void)loadView {
    [super loadView];
    self.view = self.mainView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)bindViewAndViewModel{
    DKLoginViewModel *loginViewModel = self.mainViewModel;
    DKLoginView *loginView = self.mainView;
    
    RAC(loginViewModel,phone) = [loginView textFieldForPhone].rac_textSignal;
    RAC(loginViewModel,code) = [loginView textFieldForCode].rac_textSignal;
    
    [loginView buttonToRequestCode].rac_command = loginViewModel.requestCodeCommand;
    [loginView buttonToRequestLogin].rac_command = loginViewModel.loginCommand;
    
    @weakify(loginViewModel,loginView);
    // 请求验证码
    [loginView prepareForCodeRequest];
    [[loginViewModel.requestCodeCommand.executing skip:1] subscribeNext:^(NSNumber *value) {
        if (value.boolValue) {
            @strongify(loginView);
            [loginView doingCodeRequestAction];
        }
    }];
    
    [loginViewModel.requestCodeCommand.executionSignals subscribeNext:^(RACSignal *signal) {
        @strongify(loginView);
        [[[signal  doError:^(NSError *error) {
            [loginView finishCodeRequestWithError:error];
        }] doCompleted:^{
            [loginView finishCodeRequestWithError:nil];
        }] subscribeCompleted:^{
            @strongify(loginViewModel,loginView);
            [loginView prepareForTimerAction];
            [[[loginViewModel timerSignalWithDuration:10] doCompleted:^{
                [loginView finishTimerAction];
            }] subscribeNext:^(id x) {
                [loginView doingTimerWithTitle:x];
            }];
        }];
    }];
    
    //登录行为
    [[loginViewModel.loginCommand.executing skip:1] subscribeNext:^(NSNumber *value) {
        if (value.boolValue) {
            @strongify(loginView);
            [loginView doingLoginRequestAction];
        }
    }];
    
    [loginViewModel.loginCommand.executionSignals subscribeNext:^(RACSignal *signal) {
        @strongify(loginView);
        [[[signal doNext:^(id x) {
//            [loginView prepareForLoginRequest];
        }] doError:^(NSError *error) {
            [loginView finishLoginRequestWithError:error Response:nil];
        }] subscribeNext:^(id x) {
            [loginView finishLoginRequestWithError:nil Response:x];
        }];
    }];
}

#pragma mark - Getter methods

-(DKLoginView *)mainView{
    if (_mainView == nil) {
        _mainView = [self loginView];
    }
    return _mainView;
}
-(DKLoginViewModel *)mainViewModel{
    if (_mainViewModel == nil) {
        _mainViewModel = [self loginViewModel];
    }
    return _mainViewModel;
}
@end

@implementation DKLoginViewController (Subclass)

-(DKLoginView *)loginView{
    return [DKLoginView view];
}

-(DKLoginViewModel *)loginViewModel{
    return [DKLoginViewModel new];
}

@end
