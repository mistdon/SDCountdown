# SDCountdown
Countdown Button, with GCD, what you can do with code or XIB.    
用GCD实现倒计时Button, 可以在多线程中使用，不用担心循环引用。   
可以用纯代码或者Xib创建。

# 如何安装How to install
  * cocoapods 安装
    'pod SDCountdownButton'
  * 手动安装
    将SDCountdown.h/m拖到工程中，手动引用

# How to Use SDCountdownButton
 ![(Demo)](https://github.com/momo13014/SDCountdown/blob/master/ScreentShot/demo.gif)

 * 你可以设置Button的初始化Title，可以和结束后的title不一样。默认为两者都为“获取验证码”
 * 如果你不需要在数字变化时的闪动效果，可将Button的type设置为Custom
```
//设置变化过程中Button的title，如
[SDCountDownButton setChangingFormatter:^NSString *(NSTimeInterval second) {
    return [NSString stringWithFormat:@"%.0lf S", second];
}];
//设置倒计时结束后的title
[self.one setFinishedString:@"涨涨涨"];
```
或者在Xib中直接设置finishString  
![(png)](https://github.com/momo13014/SDCountdown/blob/master/ScreentShot/finishString.png)
````
//倒计时结束后的回调
[SDCountDownButton completed:^{
    NSLog(@"The count down is over.");
}];
````
