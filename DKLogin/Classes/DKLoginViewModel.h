//
//  DKLoginViewModel.h
//  DKLoginConfig
//
//  Created by NaCai on 16/8/19.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACCommand;
@class RACSignal;
@protocol DKLoginProtocol;

@interface DKLoginViewModel : NSObject

/*
 * phone number
*/
@property(nonatomic, copy) NSString *phone;

/*
 * 验证码
 */
@property(nonatomic, copy) NSString *code;

/*
 * 基于RACCommand实现的请求验证码逻辑
 */
@property(nonatomic, strong) RACCommand *requestCodeCommand;

/*
 * 基于RACCommand实现的登录逻辑
 */
@property(nonatomic, strong) RACCommand *loginCommand;

/*
 * 基于RAC实现的定时器功能
 */
- (RACSignal *)timerSignalWithDuration:(NSUInteger)duration;

@end

@interface DKLoginViewModel(Subclass)
/*
 * 登录的网络请求,返回值为RACSignal
 */
- (RACSignal *)loginRequestSignal;

/*
 * 获取验证码的网络请求,返回值为RACSignal
 */
- (RACSignal *)codeRequestSignal;

/*
 * 验证手机号是否合法,建议只做长度验证
 */
- (BOOL)isValidPhoneNumber:(NSString *)phone;

/*
 * 验证短信验证码是否合法
 */
- (BOOL)isValidCodeNumber:(NSString *)code;
@end