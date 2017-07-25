//
//  GZYPictureFloldVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "GZYPictureFloldVc.h"

@interface GZYPictureFloldVc ()
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageV;
@property (weak, nonatomic) IBOutlet UIImageView *topImageV;
@property (weak, nonatomic) IBOutlet UIView *dragView;
@property (nonatomic, strong) CAGradientLayer       * gradient;


@end

@implementation GZYPictureFloldVc

- (void)viewDidLoad {
    [super viewDidLoad];
    //让上部分图片只显示上半部分
    self.topImageV.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    //让下部分图片只显示下部分
    self.bottomImageV.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    //锚点
    self.topImageV.layer.anchorPoint = CGPointMake(0.5, 1);
    
    self.bottomImageV.layer.anchorPoint = CGPointMake(0.5, 0);
    //给底部图片添加渐变
    //渐变层
    CAGradientLayer * gradient = [CAGradientLayer layer];
    gradient.frame = self.bottomImageV.bounds;
    gradient.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor blueColor].CGColor];
    //设置不透明度
    gradient.opacity = 0;
    self.gradient = gradient;
    [self.bottomImageV.layer addSublayer:gradient];
    
    //添加拖拽是手势
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.dragView addGestureRecognizer:pan];
    
}
- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint transP = [pan translationInView:self.dragView];
    CATransform3D transform = CATransform3DIdentity;
    //立体的效果， 近大远小
    transform.m34 = -1 /550.0;
    
    //设置不透明度
    CGFloat opcity = transP.y * 1 /256.0;
    self.gradient.opacity = opcity;
    
    CGFloat angle = transP.y * M_PI /256.0;
    
    self.topImageV.layer.transform = CATransform3DRotate(transform, -angle, 1, 0, 0);
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        self.gradient.opacity = 0;
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.25 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            //让上部图片反弹回去
            self.topImageV.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
