# SDCountdown
Countdown Button, with GCD, what you can do with code or XIB,

# How to Install


# How to use
```
[SDCountDownButton setChangingFormatter:^NSString *(NSTimeInterval second) {
return [NSString stringWithFormat:@"%.0lf S", second];
}];
[SDCountDownButton setFinishFormatter:^NSString *{
return @"重新开始吧";
}];
[SDCountDownButton completed:^{
NSLog(@"倒计时完毕");
}];
````
