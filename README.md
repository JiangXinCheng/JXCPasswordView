# JXCPasswordView
一个简单的自定义密码，验证码输入框
##JXCPasswordView
[github地址](https://github.com/JiangXinCheng/JXCPasswordView)

###使用方法
下载上面的项目，然后把JXCPasswordView的.h和.m文件拖到自己项目中

在需要使用的地方引入头文件
```
#import "JXCPasswordView.h"
```

声明属性
```
@property (nonatomic,strong)JXCPasswordView *verCodeView;
```

确定密码框宽度
```
#define kCodeViewWidth [UIScreen mainScreen].bounds.size.width * 0.124 * 6
```


JXCPasswordView公共方法
```
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
```

在自己的场景中调用
```
- (void)setPswdView {
    _verCodeView = [[JXCPasswordView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-kCodeViewWidth)/2, 300, kCodeViewWidth, kCodeViewWidth/6) andLength:6 andBoldColor:[UIColor blackColor]];
    _verCodeView.backgroundColor = [UIColor whiteColor];
    _verCodeView.delegate = self;
    [self.view addSubview:_verCodeView];
}
```

实现代理方法
```
- (void)getPassWord:(NSString *)password {
    NSLog(@"验证码：%@",password);
    
    /**
     在这里根据需求校验输入的密码或者验证码是否正确
     如果验证失败，则调用方法清除页面
     */
    
//    [_verCodeView cleanDatas];
    
}
```
