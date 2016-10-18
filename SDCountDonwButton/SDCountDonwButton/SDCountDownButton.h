//
//  SDCountDownButton.h
//  SDCountDonwButton
//
//  Created by shendong on 16/10/18.
//  Copyright © 2016年 shendong. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SDCountDownButton : UIButton

@property (nonatomic,readonly) BOOL isStarted;

//! 开始倒计时
- (void)startCountDown:(NSTimeInterval)secdons;
//! 取消倒计时
- (void)cancelCountDown;

- (void)setChangingFormatter:(NSString *(^)(NSTimeInterval second))changingFormatter;
- (void)setFinishFormatter:(NSString *(^)())finishFormatter;
- (void)completed:(void(^)())completionBlock;

@end
