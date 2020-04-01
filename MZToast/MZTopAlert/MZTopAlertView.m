//
//  MZTopAlertView.m
//  MZToast
//
//  Created by Mr.Z on 2020/1/17.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZTopAlertView.h"

@interface MZTopAlertView ()

@property (nonatomic, strong) UIImageView *alertImgView;
@property (nonatomic, strong) UILabel *alertLbl;

@end

@implementation MZTopAlertView

- (instancetype)init {
    if (self = [super init]) {
        self.frame = CGRectMake(0, -[self getStatusNavBarHeight], [UIScreen mainScreen].bounds.size.width, [self getStatusNavBarHeight]);
        self.backgroundColor = [UIColor greenColor];
        self.alertShowTime = 2.0;
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview {
    self.alertImgView = [[UIImageView alloc] initWithFrame:CGRectMake(16.0, [self getStatusBarHeight] + (44.0 - 20.0) * 0.5, 20.0, 20.0)];
    [self addSubview:self.alertImgView];
    self.alertLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.alertImgView.frame) + 16.0, [self getStatusBarHeight] + (44.0 - 20.0) * 0.5, self.frame.size.width - CGRectGetMaxX(self.alertImgView.frame) - 32.0, 20.0)];
    self.alertLbl.textColor = [UIColor whiteColor];
    self.alertLbl.textAlignment = NSTextAlignmentLeft;
    self.alertLbl.font = [UIFont systemFontOfSize:16.0];
    self.alertLbl.numberOfLines = 1;
    [self addSubview:self.alertLbl];
}

- (void)setAlertBackgroundColor:(UIColor *)alertBackgroundColor {
    _alertBackgroundColor = alertBackgroundColor;
    self.backgroundColor = alertBackgroundColor;
}

- (void)setAlertShowTime:(CGFloat)alertShowTime {
    _alertShowTime = alertShowTime;
}

- (CGFloat)getStatusBarHeight {
    CGFloat statusBarHeight = 0.0;
    if (@available(iOS 13.0, *)) {
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
        statusBarHeight = statusBarManager.statusBarFrame.size.height;
    } else {
        statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    return statusBarHeight;
}

- (CGFloat)getStatusNavBarHeight {
    return ([self getStatusBarHeight] + 44.0);
}

#pragma mark - 移除提示框
- (void)removeAlertView {
    [UIView transitionWithView:self duration:0.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.center = CGPointMake(self.frame.size.width * 0.5, -[self getStatusNavBarHeight] * 0.5);
    } completion:^(BOOL finished) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isShowTopAlert"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self removeFromSuperview];
    }];
}

#pragma mark - 展示提示框
- (void)showAlertMessage:(NSString *)message image:(UIImage *)image {
    self.alertImgView.image = image;
    self.alertLbl.text = message;
    if (@available(iOS 13.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
        [window addSubview:self];
    } else {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
    }
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isShowTopAlert"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [UIView transitionWithView:self duration:0.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.center = CGPointMake(self.frame.size.width * 0.5, [self getStatusNavBarHeight] * 0.5);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(removeAlertView) withObject:nil afterDelay:self.alertShowTime];
    }];
}

+ (void)showSuccessfulAlert:(NSString *)message {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isShowTopAlert"]) {
        return;
    }
    MZTopAlertView *alert = [[MZTopAlertView alloc] init];
    alert.alertBackgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
    alert.alertShowTime = 2.0;
    [alert showAlertMessage:message image:[UIImage imageNamed:@"icon_alert_success"]];
}

+ (void)showFailedAlert:(NSString *)message {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isShowTopAlert"]) {
        return;
    }
    MZTopAlertView *alert = [[MZTopAlertView alloc] init];
    alert.alertBackgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    alert.alertShowTime = 2.0;
    [alert showAlertMessage:message image:[UIImage imageNamed:@"icon_alert_fail"]];
}

@end
