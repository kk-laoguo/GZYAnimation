//
//  PictureLodingVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/20.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "PictureLodingVc.h"
#import "PictureLodingNextVc.h"
#define K_WIDTH  [UIScreen mainScreen].bounds.size.width
#define k_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface PictureLodingVc ()

@end

@implementation PictureLodingVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self animation1];
    [self animation2];
    [self animation3];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步有惊喜哦" style:UIBarButtonItemStylePlain target:self action:@selector(goNextVc)];
    
    
}
- (void)goNextVc {
    PictureLodingNextVc * vc = [[PictureLodingNextVc alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)animation1 {
    UIView * animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, K_WIDTH, 120)];
    animationView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:animationView];
    
    CAShapeLayer * animationLayer = [CAShapeLayer layer];
    animationLayer.backgroundColor = [UIColor redColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
    animationLayer.position = CGPointMake((K_WIDTH+100)/2.0,50);
    animationLayer.cornerRadius = 10.f;
    
    CGMutablePathRef path = CGPathCreateMutable();
    // 创建转圈的动画
    CGPathAddEllipseInRect(path, nil, CGRectMake((K_WIDTH-100)/2.0, 10, 100, 100));
    
    
    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 2.f;
    keyAnimation.repeatCount = HUGE;
    keyAnimation.path = path;

    [animationLayer addAnimation:keyAnimation forKey:nil];
    
    
    CAReplicatorLayer * replicator = [CAReplicatorLayer layer];
    replicator.frame = CGRectMake(0, 0, K_WIDTH, 120);
    [replicator addSublayer:animationLayer];

    replicator.instanceCount = 20;
    replicator.repeatCount = HUGE;
    //动画延迟
    replicator.instanceDelay = 0.2f;
    //透明度递减
    replicator.instanceAlphaOffset -= 0.1;
    //
    
    [animationView.layer addSublayer:replicator];
    
}
- (void)animation2 {
    UIView * animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, K_WIDTH, 300)];
    animationView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:animationView];
    
    CAShapeLayer * animationLayer = [CAShapeLayer layer];
    animationLayer.backgroundColor = [UIColor redColor].CGColor;
    animationLayer.bounds = CGRectMake(0, 0, 20, 20);
    animationLayer.position = CGPointMake(animationView.center.x, 50);
    animationLayer.borderColor = [UIColor blueColor].CGColor;
    animationLayer.cornerRadius = 2.f;
    animationLayer.borderWidth = 1;
    animationLayer.transform = CATransform3DMakeScale(0, 0, 0);
    CABasicAnimation * basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    basicAnimation.duration = 2;
    basicAnimation.repeatCount = HUGE;
    basicAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    basicAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)];
    [animationLayer addAnimation:basicAnimation forKey:nil];
    
    CAReplicatorLayer * replicator = [CAReplicatorLayer layer];
    replicator.frame = CGRectMake(0, 0, K_WIDTH, 300);
    replicator.backgroundColor = [UIColor cyanColor].CGColor;
    [replicator addSublayer:animationLayer];
    
    replicator.instanceCount = 30;
    replicator.instanceDelay = 0.1;
    CGFloat angle = (2*M_PI)/20.0;
    replicator.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1.0);
    [animationView.layer addSublayer:replicator];
}

- (void)animation3 {
    
    UIView * grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 500, K_WIDTH, k_HEIGHT-500)];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayView];
    
    CGFloat radius = 40;
    CAShapeLayer * shape = [CAShapeLayer layer];
    shape.frame = CGRectMake(50, 50, radius, radius);
    shape.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, radius, radius)].CGPath;
    shape.fillColor = [UIColor redColor].CGColor;
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0.0)];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)];
    animation.autoreverses = YES;
    animation.repeatCount = HUGE;
    animation.duration = 0.8;
    [shape addAnimation:animation forKey:nil];
    
    CAReplicatorLayer * replicator = [CAReplicatorLayer layer];
    replicator.frame = CGRectMake(0, 0,K_WIDTH,grayView.frame.size.height);
    replicator.backgroundColor = [UIColor blueColor].CGColor;
    replicator.instanceDelay = 0.2;
    replicator.instanceCount = 4;
    replicator.instanceTransform = CATransform3DMakeTranslation(50,0,0);

    [replicator addSublayer:shape];
    [grayView.layer addSublayer:replicator];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
