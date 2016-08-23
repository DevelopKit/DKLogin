//
//  DKLoginViewController.h
//  DKLoginConfig
//
//  Created by NaCai on 16/8/19.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DKLoginViewModel;
@class DKLoginView;

@interface DKLoginViewController : UIViewController

@end


@interface DKLoginViewController (Subclass)

- (DKLoginView *)loginView;
- (DKLoginViewModel *)loginViewModel;

@end