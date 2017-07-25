//
//  ZYReflectionView.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "ZYReflectionView.h"

@implementation ZYReflectionView

+ (Class)layerClass {
    return [CAReplicatorLayer class];
}
@end
