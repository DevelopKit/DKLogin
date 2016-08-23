//
//  LoginViewController.m
//  DKLoginSample
//
//  Created by NaCai on 16/8/22.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(DKLoginView *)loginView{
    return [LoginView view];
}
-(DKLoginViewModel *)loginViewModel{
    return [LoginViewModel new];
}
@end
