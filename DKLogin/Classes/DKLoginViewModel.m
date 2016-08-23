//
//  DKLoginViewModel.m
//  DKLoginConfig
//
//  Created by NaCai on 16/8/19.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "DKLoginViewModel.h"

@interface DKLoginViewModel()
@end

@implementation DKLoginViewModel

#pragma mark - <Init methods>

- (instancetype)init {
    self = [super init];
    if (self) {
        [self _setup];
    }

    return self;
}

#pragma mark - <Private methods>
- (void)_setup{
    @weakify(self);
    RACSignal *requestCodeEnableSignal = [RACObserve(self,phone) map:^id(NSString *value) {
        @strongify(self);
        return @([self isValidPhoneNumber:value]);
    }];
    self.requestCodeCommand = [[RACCommand alloc] initWithEnabled:requestCodeEnableSignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        return self.codeRequestSignal;
    }];

    RACSignal *loginEnableSignal = [RACSignal combineLatest:@[
            requestCodeEnableSignal,
            [RACObserve(self,code) map:^id(NSString * value) {
                @strongify(self);
                return @([self isValidCodeNumber:value]);
            }]] reduce:^id (NSNumber *first, NSNumber *second){
        return @(first.boolValue && second.boolValue);
    }];
    self.loginCommand = [[RACCommand alloc] initWithEnabled:loginEnableSignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        return self.loginRequestSignal;
    }];
}

#pragma mark - <倒计时信号>
- (RACSignal *)timerSignalWithDuration:(NSUInteger)duration {
    __block NSInteger time = duration;
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        return [[RACScheduler mainThreadScheduler] after:[NSDate dateWithTimeIntervalSinceNow:1] repeatingEvery:1 withLeeway:0.0 schedule:^{
            if (time > 0) {
                [subscriber sendNext:@(time).stringValue];
                time --;
            } else{
                [subscriber sendCompleted];
            }
        }];
    }];
}

@end

@implementation DKLoginViewModel (Subclass)
- (RACSignal *)loginRequestSignal {
    return nil;
}
- (RACSignal *)codeRequestSignal {
    return nil;
}
- (BOOL)isValidCodeNumber:(NSString *)code {
    return code.length == 4;
}
- (BOOL)isValidPhoneNumber:(NSString *)phone {
    return phone.length == 11;
}
@end