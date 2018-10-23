//
//  JXCPasswordView.m
//  TruvisioExpressApp
//
//  Created by 王能森 on 2018/10/22.
//  Copyright © 2018年 JiangXinCheng. All rights reserved.
//

#import "JXCPasswordView.h"

@interface JXCPasswordView () <UITextFieldDelegate>

@property (nonatomic,strong)UITextField *hiddenTF;  // 隐藏的输入框
@property (nonatomic,strong)UIColor *boldColor;
@property (nonatomic,assign)NSInteger passwordLength;
@property (nonatomic,strong)UITextField *pswTF;

@end

@implementation JXCPasswordView

- (instancetype)initWithFrame:(CGRect)frame andLength:(NSInteger)length andBoldColor:(UIColor *)boldColor {
    if (self = [super init]) {
        self.frame = frame;
        self.boldColor = boldColor;
        self.passwordLength = length;
        
        [self initUI];
    }
    return self;
}

#pragma mark - 触发事件
- (void)viewClick {
    // 点击视图之后使tf成为键盘的第一响应者
    [self.pswTF becomeFirstResponder];
}

- (void)valueChange:(UITextField *)tf {
    if (tf.text.length > 6) {
        return;
    }
    
    if (tf.text.length <= self.passwordLength) {
        for (NSInteger i=0;i<self.passwordLength;i++) {
            UILabel *pswdLabel = (UILabel *)[self viewWithTag:100+i];
            if (i < tf.text.length) {
                pswdLabel.text = [tf.text substringWithRange:NSMakeRange(i, 1)];
            } else {
                pswdLabel.text = @"";
            }
        }
    }
    
    if (tf.text.length == 6) {
        [self.delegate getPassWord:tf.text];
    }
}

// 清除原先的密码
- (void)cleanDatas {
    self.pswTF.text = @"";
    for (NSInteger i=0;i<self.passwordLength;i++) {
        UILabel *pswdLabel = (UILabel *)[self viewWithTag:100+i];
        pswdLabel.text = @"";
    }
}

#pragma mark - UI
- (void)initUI {
    
    
    // 添加隐藏的tf
    [self addSubview:self.pswTF];
    
    // 给视图添加点击事件展开键盘
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self addGestureRecognizer:tap];
    
    CGFloat numberWidth = self.frame.size.width/self.passwordLength;
    for (NSInteger i=0;i<self.passwordLength;i++) {
        UILabel *pswdLabel = [[UILabel alloc] init];
        pswdLabel.text = @"";
        pswdLabel.backgroundColor = [UIColor clearColor];
        pswdLabel.textColor = [UIColor blackColor];
        pswdLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:pswdLabel];
        
        pswdLabel.tag = 100 + i;
        pswdLabel.frame = CGRectMake(i*numberWidth, 0, numberWidth, numberWidth);
    }
}

// 绘制密码框
- (void)drawRect:(CGRect)rect{
    
    [self.boldColor set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置属性
    path.lineWidth = 1.f;
    
    
    //设置路径
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path stroke];
    
    
    CGFloat numberWidth = self.frame.size.width/self.passwordLength;
    
    for (NSInteger i=0;i<self.passwordLength;i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = .5f;
        [path moveToPoint:CGPointMake(i*numberWidth, 0)];
        [path addLineToPoint:CGPointMake(i*numberWidth, numberWidth)];
        [path stroke];
    }
    
    
}

- (UITextField *)pswTF{
    if (!_pswTF) {
        _pswTF = [[UITextField alloc] init];
        
        _pswTF.delegate = self;
        
        _pswTF.keyboardType = UIKeyboardTypeNumberPad;
        
        //添加对输入值的监视
        [_pswTF addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _pswTF;
}


@end
