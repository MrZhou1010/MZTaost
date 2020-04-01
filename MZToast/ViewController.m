//
//  ViewController.m
//  MZToast
//
//  Created by Mr.Z on 2020/1/17.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "ViewController.h"
#import "MZTopAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *successbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    successbutton.frame = CGRectMake(50, 100, 120, 50);
    [successbutton setTitle:@"成功" forState:UIControlStateNormal];
    [successbutton setBackgroundColor:[UIColor blueColor]];
    [successbutton addTarget:self action:@selector(showSuccessfulAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:successbutton];
    
    UIButton *failbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    failbutton.frame = CGRectMake(50, 200, 120, 50);
    [failbutton setTitle:@"失败" forState:UIControlStateNormal];
    [failbutton setBackgroundColor:[UIColor redColor]];
    [failbutton addTarget:self action:@selector(showFailedAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:failbutton];
}

- (void)showSuccessfulAlert {
    [MZTopAlertView showSuccessfulAlert:@"修改密码成功！"];
}

- (void)showFailedAlert {
    [MZTopAlertView showFailedAlert:@"修改密码失败！"];
}

@end
