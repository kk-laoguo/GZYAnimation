//
//  GZYHeaderBeatVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "GZYHeaderBeatVc.h"

@interface GZYHeaderBeatVc ()
@property (weak, nonatomic) IBOutlet UIImageView *picImageV;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageV;
@end

@implementation GZYHeaderBeatVc

- (void)viewDidLoad {
    [super viewDidLoad];
}
//转场动画
- (IBAction)transitionBtnClick:(id)sender {
    UIButton * button = (UIButton *)sender;
    button.tag ++;
    self.picImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)button.tag]];
    CATransition * transition = [CATransition animation];
//    transition.type = @"moveIn";
    transition.type = @"pageCurl";

//    transition.subtype = @"fromLeft";
    transition.subtype = kCATransitionFromTop;
    
    //设置动画开始的点
    transition.startProgress = 0.2;
    //动画结束的点
    transition.endProgress = 0.8;
    transition.duration = 1;
    
    [self.picImageV.layer addAnimation:transition forKey:nil];
    
}
//uivew转场动画
- (IBAction)UIViewTransitonBtnClick:(UIButton *)sender {
    sender.tag ++;
    [UIView transitionWithView:self.picImageV duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.picImageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",sender.tag]];
    } completion:nil];
    
    if (sender.tag == 3) {
        sender.tag = 1;
    }
}
//心跳动画
- (IBAction)heartBeatBtnClick:(id)sender {
    CABasicAnimation * animation = [CABasicAnimation animation];
    //设置属性
    animation.keyPath = @"transform.scale";
    //
    animation.toValue = @0.5;
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.5;
    [self.heartImageV.layer addAnimation:animation forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
