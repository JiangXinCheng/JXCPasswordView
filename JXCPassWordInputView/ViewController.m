//
//  ViewController.m
//  JXCPassWordInputView
//
//  Created by 王能森 on 2018/10/23.
//  Copyright © 2018年 JiangXinCheng. All rights reserved.
//

#define kCodeViewWidth [UIScreen mainScreen].bounds.size.width * 0.124 * 6

#import "ViewController.h"
#import "JXCPasswordView.h"

@interface ViewController () <JXCPasswordViewDelegate>

@property (nonatomic,strong)JXCPasswordView *verCodeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _verCodeView = [[JXCPasswordView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-kCodeViewWidth)/2, 300, kCodeViewWidth, kCodeViewWidth/6) andLength:6 andBoldColor:[UIColor blackColor]];
    _verCodeView.backgroundColor = [UIColor whiteColor];
    _verCodeView.delegate = self;
    [self.view addSubview:_verCodeView];
    
}

#pragma mark - 代理方法
- (void)getPassWord:(NSString *)password {
    NSLog(@"验证码：%@",password);
}

@end
