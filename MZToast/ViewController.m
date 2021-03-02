//
//  ViewController.m
//  MZToast
//
//  Created by Mr.Z on 2020/1/17.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "ViewController.h"
#import "MZTopToastView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"提示框相关";
    [self setupUI];
}

- (void)setupUI {
    UIButton *successbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    successbutton.frame = CGRectMake(50.0, 100.0, 120.0, 50.0);
    [successbutton setTitle:@"成功" forState:UIControlStateNormal];
    [successbutton setBackgroundColor:[UIColor blueColor]];
    [successbutton addTarget:self action:@selector(showSuccessfulToast) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:successbutton];
    UIButton *failbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    failbutton.frame = CGRectMake(50.0, 200.0, 120.0, 50.0);
    [failbutton setTitle:@"失败" forState:UIControlStateNormal];
    [failbutton setBackgroundColor:[UIColor redColor]];
    [failbutton addTarget:self action:@selector(showFailedToast) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:failbutton];
}

- (void)showSuccessfulToast {
    [MZTopToastView showSuccessfulToast:@"修改密码成功！"];
}

- (void)showFailedToast {
    [MZTopToastView showFailedToast:@"修改密码失败！"];
}

@end
