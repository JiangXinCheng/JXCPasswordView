//
//  JXCPasswordView.h
//  TruvisioExpressApp
//
//  Created by 王能森 on 2018/10/22.
//  Copyright © 2018年 JiangXinCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JXCPasswordViewDelegate <NSObject>


/**
 通过代理获得密码

 @param password 密码
 */
- (void)getPassWord:(NSString *)password;

@end

@interface JXCPasswordView : UIView

@property (nonatomic,weak) id <JXCPasswordViewDelegate> delegate;


/**
 自定义初始化密码框

 @param frame frame
 @param length 密码长度
 @param boldColor 密码框的线条颜色
 @return 密码框
 */
- (instancetype)initWithFrame:(CGRect)frame andLength:(NSInteger)length andBoldColor:(UIColor *)boldColor;


/**
 当输入密码错误时，清除原先的密码
 */
- (void)cleanDatas;

@end

NS_ASSUME_NONNULL_END
