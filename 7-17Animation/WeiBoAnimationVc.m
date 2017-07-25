//
//  WeiBoAnimationVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "WeiBoAnimationVc.h"
#import "WeiBoChildVc.h"
@interface WeiBoAnimationVc ()

@end

@implementation WeiBoAnimationVc

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)btnClick:(id)sender {
    WeiBoChildVc * vc = [[WeiBoChildVc alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
