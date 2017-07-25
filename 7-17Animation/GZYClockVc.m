//
//  GZYClockVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "GZYClockVc.h"

#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

//每一秒旋转6度
#define perSecondA 6
//每一分旋转
#define perMinA 6
//每一小时旋转30
#define perHourA 30
//第一分时针旋转的度数
#define perMinHour 0.5

@interface GZYClockVc ()
@property (weak, nonatomic) IBOutlet UIImageView *clockImageView;
@property (nonatomic, strong) CALayer           * hourL;
@property (nonatomic, strong) CALayer           * minuteL;
@property (nonatomic, strong) CALayer           * secondL;

@end

@implementation GZYClockVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addHour];
    [self addMinue];
    [self addSecond];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self changeTime];
    }];
    [self changeTime];
    
    //中心圆点
    CALayer * layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 6, 6);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.cornerRadius = 3.0f;
    layer.position = CGPointMake(self.clockImageView.bounds.size.width* 0.5, self.clockImageView.bounds.size.height * 0.5);
    [self.clockImageView.layer addSublayer:layer];
}
- (void)changeTime {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    //components日历单元:年,月,日,时,分,秒
    //fromDate:从哪个时间开始取
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:[NSDate date]];
    //获取秒
    NSInteger currentSecond = cmp.second;
    //分
    NSInteger currentMinute = cmp.minute;
    //时
    NSInteger currentHour = cmp.hour;
    //秒针旋转多少度
    CGFloat angle = currentSecond * perSecondA;
    self.secondL.transform = CATransform3DMakeRotation(angle2Rad(angle), 0, 0, 1);
    //分针
    CGFloat minuteA = currentMinute * perMinA;
    self.minuteL.transform = CATransform3DMakeRotation(angle2Rad(minuteA), 0, 0, 1);
    //事针
    CGFloat hourA = currentHour * perHourA + currentMinute * perMinHour;
    self.hourL.transform = CATransform3DMakeRotation(angle2Rad(hourA), 0, 0, 1);
    
}
//添加时钟
- (void)addHour {
    CALayer * layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 2.5, 50);
    layer.position = CGPointMake(self.clockImageView.bounds.size.width*0.5, self.clockImageView.bounds.size.height*0.5);
    layer.anchorPoint = CGPointMake(0.5, 0.95);
    [self.clockImageView.layer addSublayer:layer];
    self.hourL = layer;
}
//添加分钟
- (void)addMinue {
    CALayer * layer = [CALayer layer];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 2, 70);
    layer.position = CGPointMake(self.clockImageView.bounds.size.width*0.5, self.clockImageView.bounds.size.height*0.5);
    layer.anchorPoint = CGPointMake(0.5, 0.9);
    [self.clockImageView.layer addSublayer:layer];
    self.minuteL = layer;
}
//添加秒针
- (void)addSecond {
    //
    CALayer * layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 1, 82);
    layer.position = CGPointMake(self.clockImageView.bounds.size.width * 0.5, self.clockImageView.bounds.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 0.85);
    [self.clockImageView.layer addSublayer:layer];
    self.secondL = layer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
