//
//  ViewController.m
//  SDCountDonwButton
//
//  Created by shendong on 16/10/18.
//  Copyright © 2016年 shendong. All rights reserved.
//

#import "ViewController.h"
#import "SDCountDownButton/SDCountDownButton.h"


@interface ViewController ()
@property (strong, nonatomic)  SDCountDownButton *btn;

@property (weak, nonatomic) IBOutlet SDCountDownButton *one;
@property (weak, nonatomic) IBOutlet SDCountDownButton *two;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.btn = [[SDCountDownButton alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-200)/2.0, 300, 200, 50)];
    [self.btn setTitle:@"要获取验证码" forState:UIControlStateNormal];
    [self.btn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.btn ];
    [self.btn addTarget:self action:@selector(tapaction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.btn setChangingFormatter:^NSString *(NSTimeInterval second) {
        return [NSString stringWithFormat:@"%.0lf S", second];
    }];

    [self.btn completed:^{
        NSLog(@"倒计时完毕");
    }];
    [self.one setTitle:@"Game" forState:UIControlStateNormal];
    [self.one setFinishedString:@"涨涨涨"];
    
    [self.one setChangingFormatter:^NSString *(NSTimeInterval second) {
        return [NSString stringWithFormat:@"重新发送(%.0lf)", second];
    }];
    self.two.layer.cornerRadius = 10;
    self.two.layer.borderColor =  [UIColor blueColor].CGColor;
    
    
}
- (IBAction)oneTapAction:(id)sender {
    [self.one startCountDown:60];
}
- (IBAction)twoAction:(id)sender {
    [self.two startCountDown:30];
}
- (void)tapaction:(id)sender{
    [self.btn startCountDown:4];
}
- (void)dealloc{
    NSLog(@"vc dealloc");
}

@end
