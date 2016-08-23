//
//  LoginView.m
//  DKLoginConfig
//
//  Created by NaCai on 16/8/19.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import "DKProtocols.h"
#import "LoginView.h"
#import "DKButton.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LoginView()

@end

@implementation LoginView

+ (instancetype)view{
    return [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] firstObject];
}

-(UITextField *)textFieldForPhone{
    return self.txtPhone;
}
-(UITextField *)textFieldForCode{
    return self.txtCode;
}
-(UIButton *)buttonToRequestCode{
    return self.btnCode;
}
-(UIButton *)buttonToRequestLogin{
    return self.btnLogin;
}


- (void)prepareForCodeRequest {
    self.txtCode.enabled = NO;
}

- (void)doingCodeRequestAction {
    [self.btnCode startAnimating];
    self.txtPhone.enabled = NO;
}
- (void)finishCodeRequestWithError:(NSError *)error {
    self.txtCode.enabled = YES;
    [self.btnCode stopAnimating];
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请求错误" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alertView show];
    }
}

- (void)prepareForTimerAction {
    self.btnCode.userInteractionEnabled = NO;
    [self.btnCode setTitle:@"验证码已发送" forState:UIControlStateNormal];
}
- (void)doingTimerWithTitle:(NSString *)title {
    [self.btnCode setTitle:title forState:UIControlStateNormal];
}
- (void)finishTimerAction {
    self.btnCode.userInteractionEnabled = YES;
    [self.btnCode setTitle:@"获取验证码" forState:UIControlStateNormal];
}

- (void)prepareForLoginRequest {
    [self.btnLogin startAnimating];
    self.loginActionUIBlock(NO);
}
-(void)doingLoginRequestAction{
    [self.btnLogin startAnimating];
    self.loginActionUIBlock(NO);
}
- (void)finishLoginRequestWithError:(NSError *)error Response:(id)response{
    [self.btnLogin stopAnimating];
    self.loginActionUIBlock(YES);
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请求错误" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alertView show];
    } else{

    }
}

- (void (^) (BOOL))loginActionUIBlock{
    return ^(BOOL disable){
        self.txtPhone.enabled = disable;
        self.txtCode.enabled = disable;
        self.btnCode.enabled = disable;
    };
}
@end
