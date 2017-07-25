//
//  PictureLodingNextVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/21.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "PictureLodingNextVc.h"
@interface PictureLodingNextVc ()

@end

@implementation PictureLodingNextVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self animation1];
    [self animation2];
    [self animation3];
}
- (void)animation1 {
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 100)];
    bgView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:bgView];
    
    CGFloat radius = 100/4;
    CGFloat transX = 100 - radius;
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = CGRectMake(0, 0, radius, radius);
    shape.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, radius, radius)].CGPath;
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.fillColor = [UIColor redColor].CGColor;
    shape.lineWidth = 1;
    
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue = CATransform3DRotate(CATransform3DIdentity, 0.0, 0.0, 0.0, 0.0);
    scale.fromValue = [NSValue valueWithCATransform3D:fromValue];
    
    CATransform3D toValue = CATransform3DTranslate(CATransform3DIdentity, transX, 0.0, 0.0);
    toValue = CATransform3DRotate(toValue,120.0*M_PI/180.0, 0.0, 0.0, 1.0);
    
    scale.toValue = [NSValue valueWithCATransform3D:toValue];
    scale.autoreverses = NO;
    scale.repeatCount = HUGE;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scale.duration = 0.8;
    
    [shape addAnimation:scale forKey:nil];
    
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, radius, radius);
    replicatorLayer.instanceDelay = 0.0;
    replicatorLayer.instanceCount = 3;
    CATransform3D trans3D = CATransform3DIdentity;
    trans3D = CATransform3DTranslate(trans3D, transX, 0, 0);
    trans3D = CATransform3DRotate(trans3D, 120.0*M_PI/180.0, 0.0, 0.0, 1.0);
    replicatorLayer.instanceTransform = trans3D;
    [replicatorLayer addSublayer:shape];
    
    [bgView.layer addSublayer:replicatorLayer];

}
- (void)animation2 {
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(100, 250, 50, 50)];
    bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgView];
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(25, 25) radius:25 startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    //画圆
    CAShapeLayer * shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    //填充颜色
    shape.fillColor = [UIColor clearColor].CGColor;
    //边框颜色
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.lineWidth = 3.f;
    //线框类型
    shape.lineCap = kCALineCapRound;
    [bgView.layer addSublayer:shape];
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(2*M_PI);
    animation.duration = 0.6f;
    animation.repeatCount = HUGE;
    //animation.delegate=self;
    //removedOnCompletion：默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
    //fillMode：决定当前对象在非active时间段的行为.比如动画开始之前,动画结束之后
    //autoreverses:动画结束时是否执行逆动画
    //timingFunction:设定动画的速度变化
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [bgView.layer addAnimation:animation forKey:nil];
    
}

- (void)animation3 {
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 350, [UIScreen mainScreen].bounds.size.width, 150)];
    bgView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:bgView];
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 25, 100, 100) cornerRadius:50];
    //画圆
    CAShapeLayer * shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    //填充色
    shape.fillColor = [UIColor clearColor].CGColor;
    //边框颜色
    shape.strokeColor = [UIColor redColor].CGColor;
    shape.lineWidth = 5.f;
    //线框类型
    shape.lineCap = kCALineCapRound;
    [bgView.layer addSublayer:shape];
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(0.8);
    animation.duration = 2.f;
    //animation.delegate=self;
    //removedOnCompletion：默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
    //fillMode：决定当前对象在非active时间段的行为.比如动画开始之前,动画结束之后
    //autoreverses:动画结束时是否执行逆动画
    //timingFunction:设定动画的速度变化
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [shape addAnimation:animation forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
