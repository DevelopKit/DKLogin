//
//  DKLoginView.h
//  DKLogin
//
//  Created by NaCai on 16/8/22.
//  Copyright © 2016年 ZhaiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKProtocols.h"

@interface DKLoginView : UIView <DKLoginViewProtocol>

@end


@interface DKLoginView(Subclass)
+ (instancetype)view;
@end