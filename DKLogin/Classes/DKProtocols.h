//
//  DKProtocols.h
//  DKLoginConfig
//
//  Created by NaCai on 16/8/19.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import <objc/NSObject.h>

@class RACSignal;
@class UITextField;
@class UIButton;
@class NSError;

/*
 * 利用该协议来实现网络请求以及特殊功能的定制
 */
@protocol DKLoginProtocol <NSObject>
@required
/*
 * 登录的网络请求,返回值为RACSignal
 */
- (RACSignal *)loginRequestSignal;

/*
 * 获取验证码的网络请求,返回值为RACSignal
 */
- (RACSignal *)codeRequestSignal;

@optional
/*
 * 验证手机号是否合法,建议只做长度验证
 */
- (BOOL)isValidPhoneNumber:(NSString *)phone;

/*
 * 验证短信验证码是否合法
 */
- (BOOL)isValidCodeNumber:(NSString *)code;
@end



@protocol DKLoginViewProtocol <NSObject>

@required

/*
 * 输入手机号的UITextField,用来跟viewModel的phone进行绑定
 */
- (UITextField *)textFieldForPhone;

/*
 * 输入验证码的UITextField,用来跟viewModel的code进行绑定
 */
- (UITextField *)textFieldForCode;

/*
 * UIButton对象,用来跟viewModel的RACCommand进行绑定
 */
- (UIButton *)buttonToRequestCode;

/*
 * UIButton对象,用来跟viewModel的RACCommand进行绑定
 */
- (UIButton *)buttonToRequestLogin;

@optional
/*
 * 获取验证码之前的准备工作,如第一次获取验证码之前,输入验证码的文本框不允许点击
 */
- (void)prepareForCodeRequest;
/*
 * 获取验证码过程中的行为
 */
- (void)doingCodeRequestAction;
/*
 * 获取验证码完成后的行为
 */
- (void)finishCodeRequestWithError:(NSError *)error;

/*
 * 倒计时开始前的准备工作
 */
- (void)prepareForTimerAction;
/*
 * 倒计时过程中,用于更改button的title
 */
- (void)doingTimerWithTitle:(NSString *)title;
/*
 * 倒计时结束,恢复状态
 */
- (void)finishTimerAction;

/*
 * 登录请求开始之前的准备工作
 */
- (void)prepareForLoginRequest;
/*
 * 登录请求正在与服务器交互时执行的行为
 */
- (void)doingLoginRequestAction;
/*
 * 登录请求执行完成时的行为
 */
- (void)finishLoginRequestWithError:(NSError *)error Response:(id)response;
@end