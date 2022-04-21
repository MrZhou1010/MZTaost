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
    UIButton *successBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    successBtn.frame = CGRectMake(50.0, 100.0, 120.0, 50.0);
    [successBtn setTitle:@"成功" forState:UIControlStateNormal];
    [successBtn setBackgroundColor:[UIColor blueColor]];
    [successBtn addTarget:self action:@selector(showSuccessfulToast) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:successBtn];
    
    UIButton *failBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    failBtn.frame = CGRectMake(50.0, 200.0, 120.0, 50.0);
    [failBtn setTitle:@"失败" forState:UIControlStateNormal];
    [failBtn setBackgroundColor:[UIColor redColor]];
    [failBtn addTarget:self action:@selector(showFailedToast) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:failBtn];
}

- (void)showSuccessfulToast {
    [MZTopToastView showSuccessfulToast:@"修改密码成功!"];
}

- (void)showFailedToast {
    [MZTopToastView showFailedToast:@"修改密码失败!"];
}

@end
