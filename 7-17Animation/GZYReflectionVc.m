
//
//  GZYReflectionVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "GZYReflectionVc.h"

@interface GZYReflectionVc ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation GZYReflectionVc

- (void)viewDidLoad {
    [super viewDidLoad];
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.view.layer;
    repL.instanceCount = 2;
    //复制出来的子层，它都是围绕着复制层锚点进行旋转
    repL.instanceTransform = CATransform3DMakeRotation(M_PI, 1,0 , 0);
    repL.instanceRedOffset -= 0.1;
    repL.instanceGreenOffset -= 0.1;
    repL.instanceBlueOffset -= 0.1;
    repL.instanceAlphaOffset -= 0.1;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
