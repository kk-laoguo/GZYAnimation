
//
//  GZYItemButton.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/18.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "GZYItemButton.h"

@implementation GZYItemButton



- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}


- (void)setUp {
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

//-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//
//}

//-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//}

//重新对子控件布局
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.8;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat labelX = imageX;
    CGFloat labelY = imageH;
    CGFloat labelW = imageW;
    CGFloat labelH = self.bounds.size.height - imageH;
    self.titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
}


- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
