//
//  SDCountDownButton.h
//  SDCountDonwButton
//
//  Created by shendong on 16/10/18.
//  Copyright © 2016年 shendong. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SDCountDownButton : UIButton


/**
 A Boolean value indicates whether the count down is currently valid.
 */
@property (readonly, getter = isStarted) BOOL started;

/**
 The normal state' title, Default is "获取验证码"
 */
@property (nonatomic, copy) IBInspectable NSString *finishedString;



/**
 Start the count down the the given time interval.
 
 @param secdons The number of seconds between firings of the timer. If ti is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead.
 */
- (void)startCountDown:(NSTimeInterval)secdons;

/**
 Stop the count dwon.
 */
- (void)cancelCountDown;

/**
 Varible the Button's title with custome string formatter, Default is 'second S', eg: '6 S'

 @param changingFormatter the formatter
 */
- (void)setChangingFormatter:(NSString *(^)(NSTimeInterval second))changingFormatter;

/**
 The call back when the count down is finished

 @param completionBlock the call back. Warning, If you do something in the block, rember to weak self, otherwise the Button cannot dealloc, that means the count down is going on even.
 */
- (void)completed:(void(^)())completionBlock;

@end
