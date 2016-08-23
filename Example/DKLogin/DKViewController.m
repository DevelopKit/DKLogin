//
//  DKViewController.m
//  DKLogin
//
//  Created by qiang zhai on 08/23/2016.
//  Copyright (c) 2016 qiang zhai. All rights reserved.
//

#import "DKViewController.h"
#import "LoginViewController.h"

@interface DKViewController ()

@end

@implementation DKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self presentViewController:[LoginViewController new] animated:YES completion:nil];
}
@end
