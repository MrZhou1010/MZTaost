# MZToast
提示框相关

`顶部提示框`

    /// 显示提示框
    /// @param message 提示信息
    /// @param image 提示图标
    - (void)showToastMessage:(NSString *)message image:(UIImage *)image;
    
    /// 显示成功提示框
    /// @param message 提示成功信息
    + (void)showSuccessfulToast:(NSString *)message;

    /// 显示失败提示框
    /// @param message 提示失败信息
    + (void)showFailedToast:(NSString *)message;
