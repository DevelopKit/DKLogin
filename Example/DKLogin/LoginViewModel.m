//
//  LoginViewModel.m
//  DKLoginSample
//
//  Created by NaCai on 16/8/22.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import "LoginViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation LoginViewModel
- (RACSignal *)loginRequestSignal {
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            [subscriber sendNext:@"1"];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}
- (RACSignal *)codeRequestSignal {
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            [subscriber sendNext:@"1"];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}
- (BOOL)isValidCodeNumber:(NSString *)code {
    return code.length == 4;
}
- (BOOL)isValidPhoneNumber:(NSString *)phone {
    return phone.length == 11;
}
@end
