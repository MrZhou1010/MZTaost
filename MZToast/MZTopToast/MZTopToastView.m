//
//  MZTopToastView.m
//  MZToast
//
//  Created by Mr.Z on 2020/1/17.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZTopToastView.h"

@interface MZTopToastView ()

@property (nonatomic, strong) UIImageView *toastImgView;
@property (nonatomic, strong) UILabel *toastLbl;

@end

@implementation MZTopToastView

- (instancetype)init {
    if (self = [super init]) {
        self.frame = CGRectMake(0, -[self getStatusNavBarHeight], [UIScreen mainScreen].bounds.size.width, [self getStatusNavBarHeight]);
        self.backgroundColor = [UIColor greenColor];
        self.toastShowTime = 2.0;
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview {
    self.toastImgView = [[UIImageView alloc] initWithFrame:CGRectMake(16.0, [self getStatusBarHeight] + (44.0 - 20.0) * 0.5, 20.0, 20.0)];
    [self addSubview:self.toastImgView];
    self.toastLbl = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.toastImgView.frame) + 16.0, [self getStatusBarHeight] + (44.0 - 20.0) * 0.5, self.frame.size.width - CGRectGetMaxX(self.toastImgView.frame) - 32.0, 20.0)];
    self.toastLbl.textColor = [UIColor whiteColor];
    self.toastLbl.textAlignment = NSTextAlignmentLeft;
    self.toastLbl.font = [UIFont systemFontOfSize:16];
    self.toastLbl.numberOfLines = 1;
    [self addSubview:self.toastLbl];
}

- (void)setToastBackgroundColor:(UIColor *)toastBackgroundColor {
    _toastBackgroundColor = toastBackgroundColor;
    self.backgroundColor = toastBackgroundColor;
}

- (void)setToastShowTime:(CGFloat)toastShowTime {
    _toastShowTime = toastShowTime;
}

- (CGFloat)getStatusBarHeight {
    CGFloat statusBarHeight = 0.0;
    if (@available(iOS 13.0, *)) {
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.lastObject.windowScene.statusBarManager;
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
- (void)removeToastView {
    [UIView transitionWithView:self duration:0.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.center = CGPointMake(self.frame.size.width * 0.5, -[self getStatusNavBarHeight] * 0.5);
    } completion:^(BOOL finished) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isShowTopToast"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self removeFromSuperview];
    }];
}

#pragma mark - 展示提示框
- (void)showToastMessage:(NSString *)message image:(UIImage *)image {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isShowTopToast"]) {
        return;
    }
    self.toastImgView.image = image;
    self.toastLbl.text = message;
    if (@available(iOS 13.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
        [window addSubview:self];
    } else {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
    }
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isShowTopToast"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [UIView transitionWithView:self duration:0.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.center = CGPointMake(self.frame.size.width * 0.5, [self getStatusNavBarHeight] * 0.5);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(removeToastView) withObject:nil afterDelay:self.toastShowTime];
    }];
}

+ (void)showSuccessfulToast:(NSString *)message {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isShowTopToast"]) {
        return;
    }
    MZTopToastView *toast = [[MZTopToastView alloc] init];
    toast.toastBackgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
    toast.toastShowTime = 2.0;
    [toast showToastMessage:message image:[UIImage imageNamed:@"icon_toast_success"]];
}

+ (void)showFailedToast:(NSString *)message {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isShowTopToast"]) {
        return;
    }
    MZTopToastView *toast = [[MZTopToastView alloc] init];
    toast.toastBackgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    toast.toastShowTime = 2.0;
    [toast showToastMessage:message image:[UIImage imageNamed:@"icon_toast_fail"]];
}

@end
