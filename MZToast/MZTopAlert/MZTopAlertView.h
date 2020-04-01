//
//  MZTopAlertView.h
//  MZToast
//
//  Created by Mr.Z on 2020/1/17.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZTopAlertView : UIView

/// 提示框背景颜色,默认为green
@property (nonatomic, strong) UIColor *alertBackgroundColor;

/// 提示框显示时间,默认2.0
@property (nonatomic, assign) CGFloat alertShowTime;

/// 显示提示框
/// @param message 提示信息
/// @param image 提示图标
- (void)showAlertMessage:(NSString *)message image:(UIImage *)image;

/// 显示成功提示框
/// @param message 提示成功信息
+ (void)showSuccessfulAlert:(NSString *)message;

/// 显示失败提示框
/// @param message 提示失败信息
+ (void)showFailedAlert:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
