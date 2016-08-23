//
//  LoginView.h
//  DKLoginConfig
//
//  Created by NaCai on 16/8/19.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKLoginView.h"

@protocol DKLoginViewProtocol;
@class DKButton;

@interface LoginView : DKLoginView
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UITextField *txtCode;
@property (weak, nonatomic) IBOutlet DKButton *btnCode;
@property (weak, nonatomic) IBOutlet DKButton *btnLogin;


@end
