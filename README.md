# SDCountdown
Countdown Button, with GCD, what you can do with code or XIB,

# How to Use SDCountdownButton
* Install with CocoaPods: 'pod SDCountdownButton'
* Manual import
   * Drag all files in the 'SDCountdownButton' folder to project
   * Import the main file '#import "SDCountdonwButton"'

[](https://github.com/momo13014/SDCountdown/blob/master/ScreentShot/demo.gif)

# How to use

 * Button的初始化title with UIControlStateNormal，你必须手动设置
 * 如果你不需要在数字变化时的闪动效果，可将Button的type设置为Custom
```
//设置变化过程中Button的title，如
[SDCountDownButton setChangingFormatter:^NSString *(NSTimeInterval second) {
    return [NSString stringWithFormat:@"%.0lf S", second];
}];
//设置倒计时结束后的title
[SDCountDownButton setFinishFormatter:^NSString *{
    return @"Restart";
}];
//倒计时结束后的回调
[SDCountDownButton completed:^{
    NSLog(@"The count down is over.");
}];
````
