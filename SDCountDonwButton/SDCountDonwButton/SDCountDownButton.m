//
//  SDCountDownButton.m
//  SDCountDonwButton
//
//  Created by shendong on 16/10/18.
//  Copyright © 2016年 shendong. All rights reserved.
//

#import "SDCountDownButton.h"

@interface SDCountDownButton ()

@property (nonatomic) dispatch_source_t timer;
@property (nonatomic) dispatch_queue_t queue;
@property (nonatomic, readonly) void *keyContext;
@property (nonatomic, copy) void(^completionBlock)();
@property (nonatomic, copy) NSString *(^countdownChangingFormatter)(NSTimeInterval second);

@end

static NSString *const KDefaultTitle = @"获取验证码";

@implementation SDCountDownButton

#define Weak_Self   __weak typeof(self)weakSelf       = self;
#define Strong_Self __weak typeof(weakSelf)strongSelf = weakSelf;

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setTitle:KDefaultTitle forState:UIControlStateNormal];
    }
    return self;
}
- (dispatch_queue_t)queue{
    if (!_queue) {
        _queue = dispatch_queue_create(NSStringFromClass([self class]).UTF8String, DISPATCH_QUEUE_SERIAL);
        dispatch_queue_set_specific(_queue, _keyContext, _keyContext, NULL);
    }
    return _queue;
}
- (void)startCountDown:(NSTimeInterval)secdons{
    __block NSTimeInterval time = secdons;
    Weak_Self
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.queue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^{
            if (time > 1) { //If the rest time is 0, don't show it!
                time -= 1.0;
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.userInteractionEnabled = NO;
                    NSString *title = weakSelf.countdownChangingFormatter ? weakSelf.countdownChangingFormatter(time) :[NSString stringWithFormat:@"%.0f S",time];
                    [weakSelf setTitle:title forState:UIControlStateNormal];
                });
            }else{
                [weakSelf stop];
            }
    });
    dispatch_resume(self.timer);
}
- (void)cancelCountDown{
    [self stop];
}
#pragma mark - pirvate method - 
- (void)dealloc{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
    if (_queue)_queue = nil;
}

- (void)stop{
    Weak_Self
    dispatch_block_t block = ^{
        Strong_Self
        if (strongSelf) {
            [strongSelf doStop];
        }
    };
    if (dispatch_get_specific(self.keyContext)) {
        block();
    }else{
        dispatch_async(self.queue, block);
    }
}
- (void)doStop{
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
        Weak_Self
        dispatch_async(dispatch_get_main_queue(), ^{
            Strong_Self
            if (strongSelf) {
                strongSelf.userInteractionEnabled = YES;
                NSString *title = strongSelf.finishedString ? strongSelf.finishedString : KDefaultTitle;
                [strongSelf setTitle:title forState:UIControlStateNormal];
                if (strongSelf.completionBlock) {
                    strongSelf.completionBlock();
                }
            }
        });
    }
}
#pragma mark - public method -
- (BOOL)isStarted{
    if (dispatch_get_specific(self.keyContext)) {
        return self.timer != nil;
    }else{
        __block BOOL result;
        dispatch_sync(self.queue, ^{
            result = self.timer != nil;
        });
        return result;
    }
}
- (void)completed:(void (^)())completionBlock{
    self.completionBlock = completionBlock;
}
- (void)setChangingFormatter:(NSString *(^)(NSTimeInterval))changingFormatter{
    self.countdownChangingFormatter = changingFormatter;
}

@end
