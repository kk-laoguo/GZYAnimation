//
//  GZYMusicVibration.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "GZYMusicVibration.h"

@interface GZYMusicVibration ()
@property (weak, nonatomic) IBOutlet UIView *musicView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation GZYMusicVibration

- (void)viewDidLoad {
    [super viewDidLoad];
    [self musicVibration];
    [self replicatorL];
}
//音乐震动条
- (void)musicVibration {
    //复制层
    CAReplicatorLayer * repl = [CAReplicatorLayer layer];
    repl.frame = self.musicView.bounds;
    //设置复制层需要复制的个数
    repl.instanceCount = 7;
    //设置复制出来子层的位移
    repl.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    //设置动画延迟时间
    repl.instanceDelay = 0.5;
    
    //改变颜色
//    repl.instanceAlphaOffset = - 0.1;
//    repl.instanceRedOffset = -0.2;

    [self.musicView.layer addSublayer:repl];
    
    //创建一个音乐振动层
    CALayer * layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 30, 150);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position = CGPointMake(0, self.musicView.bounds.size.height);
    [repl addSublayer:layer];
    //添加动画
    CABasicAnimation * animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale.y";
    animation.toValue = @0;
    animation.duration = 0.5;
    animation.repeatCount = HUGE;
    //修改的属性
//    animation.values = @[@(1),@(0.5),@(0)];
    //旋转后再旋转到原来的位置,反极性开始
    animation.autoreverses = YES;
    [layer addAnimation:animation forKey:nil];
    
}
- (void)replicatorL {
    CAReplicatorLayer * replicator = [CAReplicatorLayer layer];
    replicator.frame = self.contentView.bounds;
    replicator.backgroundColor = [UIColor redColor].CGColor;
    [self.contentView.layer addSublayer:replicator];
    
    
    CALayer * layer1 = [CALayer layer];
    layer1.frame = CGRectMake(30, 20, 50, 50);
    layer1.backgroundColor = [UIColor cyanColor].CGColor;
    [replicator addSublayer:layer1];
    
    CALayer * layer2 = [CALayer layer];
    layer2.frame = CGRectMake(30, 80, 50, 50);
    layer2.backgroundColor = [UIColor yellowColor].CGColor;
    [replicator addSublayer:layer2];
    
    //要复制的份。包括它自己
    replicator.instanceCount = 4;
    //相对复制出来的上一个层做平移
    replicator.instanceTransform = CATransform3DMakeTranslation(60, 0, 0);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
