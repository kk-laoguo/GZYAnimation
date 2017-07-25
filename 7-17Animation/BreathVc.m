//
//  BreathVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/25.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "BreathVc.h"

@interface BreathVc ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic, assign) NSInteger tapNum;


@end

@implementation BreathVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self animation];
    
//    [self setEmitter];
}
- (void)setEmitter{
//    //添加背景图
//    UIImage *bgImage = [UIImage imageNamed:@"image_union_backgorund"];
//    self.view.backgroundColor = [UIColor     colorWithPatternImage:bgImage];
    self.view.backgroundColor = [UIColor lightGrayColor];
    //粒子图层
    CAEmitterLayer *snowLayer = [CAEmitterLayer layer];
    snowLayer.backgroundColor = [UIColor redColor].CGColor;
    //发射位置
    snowLayer.emitterPosition = CGPointMake(0,70);
    //发射源的尺寸
    snowLayer.emitterSize = CGSizeMake(640, 1);
    //发射源的形状
    snowLayer.emitterMode = kCAEmitterLayerSurface;
    //发射模式
    snowLayer.emitterShape = kCAEmitterLayerLine;
    
    //存放粒子种类的数组
    NSMutableArray *snow_array = @[].mutableCopy;
    
    for (NSInteger i=1; i<5; i++) {
        //snow
        CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
        snowCell.name = @"snow";
        //产生频率
        snowCell.birthRate = 15.0f;
        //生命周期
        snowCell.lifetime = 30.0f;
        //运动速度
        snowCell.velocity = 1.0f;
        //运动速度的浮动值
        snowCell.velocityRange = 10;
        //y方向的加速度
        snowCell.yAcceleration = 2;
        //抛洒角度的浮动值
        snowCell.emissionRange = 0.5*M_PI;
        //自旋转角度范围
        snowCell.spinRange = 0.25*M_PI;
        //粒子透明度在生命周期内的改变速度
        snowCell.alphaSpeed = 2.0f;
        //cell的内容，一般是图片
        NSString *snow_str = [NSString stringWithFormat:@"snow%ld",i];
        snowCell.contents = (id)[UIImage imageNamed:snow_str].CGImage;
        
        [snow_array addObject:snowCell];
    }
    
    //添加到当前的layer上
    snowLayer.shadowColor = [[UIColor redColor]CGColor];
    snowLayer.cornerRadius = 1.0f;
    snowLayer.shadowOffset = CGSizeMake(1, 1);
    snowLayer.emitterCells = [NSArray arrayWithArray:snow_array];
    [self.view.layer insertSublayer:snowLayer atIndex:0];
}
- (void)animation {
    //透明度动画
    CABasicAnimation * opaciAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opaciAnimation.fromValue = @1;
    opaciAnimation.toValue = @0;
    opaciAnimation.duration = 3.f;
    opaciAnimation.repeatCount = HUGE;
    //动画可逆
    opaciAnimation.autoreverses = YES;
    //removedOnCompletion：默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
    //fillMode：决定当前对象在非active时间段的行为.比如动画开始之前,动画结束之后
    //autoreverses:动画结束时是否执行逆动画
    //timingFunction:设定动画的速度变化
    opaciAnimation.removedOnCompletion = NO;
    opaciAnimation.fillMode = kCAFillModeForwards;
    opaciAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.bgView.layer addAnimation:opaciAnimation forKey:nil];
    
    
    self.bgView.layer.anchorPoint = CGPointMake(0.5, 0);
    //摇摆动画
    CABasicAnimation * rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @(-1);
    rotationAnimation.toValue = @(1);
    rotationAnimation.duration = 1.f;
    rotationAnimation.repeatCount = HUGE;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.autoreverses = YES;
    [self.bgView.layer addAnimation:rotationAnimation forKey:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
