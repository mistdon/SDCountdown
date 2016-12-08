//
//  SPayClientWechatConfigModel.h
//  SPaySDK
//
//  Created by wongfish on 15/8/3.
//  Copyright (c) 2015年 wongfish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPayClientWechatConfigModel : NSObject



/**
 *  app Scheme(微信APP支付，配置的app Scheme，需要与Appid一致)
 */
@property (nonatomic,copy) NSString *appScheme;

/**
 *  微信 Appid
 */
@property (nonatomic,copy) NSString *wechatAppid;



/**
 *  app Scheme(微信Wap支付，配置的app Scheme，需要保证唯一性)
 */
@property (nonatomic,copy) NSString *wapAppScheme;


@end
