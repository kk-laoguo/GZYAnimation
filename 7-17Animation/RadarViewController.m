//
//  RadarViewController.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/20.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "RadarViewController.h"

#define K_WIDTH  [UIScreen mainScreen].bounds.size.width
#define k_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface RadarViewController ()

@property (weak, nonatomic) IBOutlet UIView *animationView;

@end

@implementation RadarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self animation];
}
- (void)animation {
    
    CAShapeLayer * animationLayer = [CAShapeLayer layer];
    animationLayer.backgroundColor = [UIColor redColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
    animationLayer.cornerRadius = 10.f;
    animationLayer.position = CGPointMake(K_WIDTH/2.0, 100);
    
     // 放大的动画
    CABasicAnimation * basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    basicAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)];
    basicAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(10.0, 10.0, 0)];
    basicAnimation.duration = 4.f;
    
    // 透明度动画(其实也可以直接设置CAReplicatorLayer的instanceAlphaOffset来实现)
    CABasicAnimation * alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1.0;
    alphaAnimation.toValue = @0.0;
    alphaAnimation.duration = 4.f;
    
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[basicAnimation,alphaAnimation];
    animationGroup.duration = 4.f;
    animationGroup.repeatCount = HUGE;
    animationGroup.autoreverses = NO;
    [animationLayer addAnimation:animationGroup forKey:nil];
    
    CAReplicatorLayer * replicatorLayer = [CAReplicatorLayer layer];
    [replicatorLayer addSublayer:animationLayer];
    replicatorLayer.instanceCount = 5;
    replicatorLayer.instanceDelay = 0.3;
    [self.animationView.layer addSublayer:replicatorLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
