//
//  WeiBoChildVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "WeiBoChildVc.h"
#import "GZYItemButton.h"

#define kDeviceHight [UIScreen mainScreen].bounds.size.height
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
@interface WeiBoChildVc ()
@property (nonatomic, strong) NSMutableArray        * btnArr;
@property (nonatomic, assign) NSInteger               btnIndex;
@property (nonatomic, strong) NSTimer               * timer;
@property (nonatomic, strong) NSArray               * titleArr;
@property (nonatomic, strong) NSArray               * imgArr;
@end

@implementation WeiBoChildVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.btnArr = [NSMutableArray array];
    self.imgArr = @[@"tabbar_compose_review",@"tabbar_compose_more",
                    @"tabbar_compose_camera",@"tabbar_compose_photo",
                    @"tabbar_compose_idea",@"tabbar_compose_review"];
    self.titleArr = @[@"点评",@"更多",
                      @"拍摄",@"相册",
                      @"文字",@"签到"];
    
    [self addBtn];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"返回上一界面" forState:UIControlStateNormal];
    btn.center = CGPointMake(kDeviceWidth * 0.5, kDeviceHight * 0.9);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
}
- (void)update {
    //
    if (self.btnIndex == self.btnArr.count) {
        [self.timer invalidate];
        return;
    }
    UIButton * btn = (UIButton *)self.btnArr[self.btnIndex];
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        btn.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
    self.btnIndex += 1;
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addBtn {
    
    CGFloat btnWH = 100;
    int cloumn = 3;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - cloumn * btnWH) / (cloumn + 1);
    CGFloat x = 0;
    CGFloat y = 0;
    int curCloumn = 0;
    int curRow = 0;
    CGFloat oriY = 300;
    
    for (int i = 0; i < self.imgArr.count; i++) {
        
        
        GZYItemButton *btn = [GZYItemButton buttonWithType:UIButtonTypeCustom];
        
        //当前所在的列
        curCloumn = i % cloumn;
        //当前所在的行
        curRow = i / cloumn;
        
        x = margin + (btnWH + margin) * curCloumn;
        y = oriY + (btnWH + margin) * curRow;
        btn.frame = CGRectMake(x, y, btnWH, btnWH);
        
        
        //设置按钮图片
        [btn setImage:[UIImage imageNamed:self.imgArr[i]] forState:UIControlStateNormal];
        //设置按钮文字
        [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        //开始时让所有按钮都移动到最底部
        btn.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
        [self.btnArr addObject:btn];
        
        //监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//手机按下时调用
- (void)btnClick:(UIButton *)button {
    
    [UIView animateWithDuration:0.5f animations:^{
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}
- (void)btnClick1:(UIButton *)button {
    [UIView animateWithDuration:0.5f animations:^{
        button.alpha = 0;
        button.transform = CGAffineTransformMakeScale(2, 2);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
