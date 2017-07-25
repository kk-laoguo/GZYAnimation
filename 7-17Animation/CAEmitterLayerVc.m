//
//  CAEmitterLayerVc.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/25.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "CAEmitterLayerVc.h"
//获得屏幕的宽高
#define mainW [UIScreen mainScreen].bounds.size.width
#define mainH [UIScreen mainScreen].bounds.size.height

@interface CAEmitterLayerVc ()
//music
@property (nonatomic, strong) CAEmitterLayer * noteEmitter;
//花瓣
@property (nonatomic, strong) CAEmitterLayer * petalEmitter;
//太阳
@property (nonatomic, strong) CAEmitterLayer * sunEmitter;
@end

@implementation CAEmitterLayerVc

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建控件
    [self createControl];
}
- (void)createControl {
    //唱歌小人背景
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((mainW - 170) * 0.5, mainH - 350, 170, 190)];
    imageView.image = [UIImage imageNamed:@"bj"];
    [self.view addSubview:imageView];
    
    //按钮标题数组
    NSArray *titleArray = @[@"唱歌", @"花瓣", @"太阳", @"停止"];
    //按钮宽度
    CGFloat btnWidth = 70;
    //按钮间距
    CGFloat padding = (mainW - btnWidth * titleArray.count) / (titleArray.count + 1);
    //创建按钮
    for (int i = 0; i < titleArray.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(padding + (padding + btnWidth) * i, CGRectGetMaxY(imageView.frame) + 20, btnWidth, 30)];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor orangeColor]];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}
- (void)btnOnClick:(UIButton *)btn {
    //唱歌按钮点击事件
    if (btn.tag == 0) {
        //重复点击先清空发射器
        [_noteEmitter removeFromSuperlayer];
        _noteEmitter = nil;
        
        //初始化发射器
        _noteEmitter = [[CAEmitterLayer alloc] init];
        //粒子发射位置
        _noteEmitter.emitterPosition = CGPointMake(mainW * 0.5 + 15, 420);
        //发射源的尺寸大小
        _noteEmitter.emitterSize = CGSizeMake(10, 10);
        //发射模式
        _noteEmitter.renderMode = kCAEmitterLayerUnordered;
        //发射源的形状
        _noteEmitter.emitterMode = kCAEmitterLayerSurface;
        
        //发射单元
        NSMutableArray *cellArray = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            CAEmitterCell *note = [CAEmitterCell emitterCell];
            //粒子产生速度
            note.birthRate = 0.7 + 0.5 * i;
            note.speed = 0.5;
            //粒子移动速度
            note.velocity = 100;
            //在原属性上增减的范围，现在粒子速度范围是100 - 30 ~ 100 + 30(70 ~ 130),其他属性后加Range同理
            note.velocityRange = 30;
            //粒子生命周期
            note.lifetime = 0.8;
            note.lifetimeRange = 0.1;
            //粒子旋转速度
            note.spin = 1;
            //粒子缩放比例
            note.scale = 0.1;
            note.scaleSpeed = 1;
            //粒子透明度变化速度
            //            note.alphaSpeed = -0.8;
            //粒子发射角度
            note.emissionLongitude = M_PI + M_PI_2;
            note.emissionRange = M_PI_2;
            //随机生成图片名字
            NSString *str = [NSString stringWithFormat:@"note%d", arc4random_uniform(4)];
            note.contents = (__bridge id)[[UIImage imageNamed:str] CGImage];
            //粒子展示的图片
            NSString *name = [NSString stringWithFormat:@"note%d", i];
            //粒子的名字
            note.name = name;
            [cellArray addObject:note];
        }
        _noteEmitter.emitterCells = cellArray;
        //添加到layer层
        [self.view.layer addSublayer:_noteEmitter];
        
        //花瓣按钮点击事件
    }else if (btn.tag == 1) {
        [_petalEmitter removeFromSuperlayer];
        _petalEmitter = nil;
        
        _petalEmitter = [[CAEmitterLayer alloc] init];
        _petalEmitter.emitterPosition = CGPointMake(0, 0);
        _petalEmitter.emitterSize = CGSizeMake(mainW, 1);
        _petalEmitter.renderMode = kCAEmitterLayerOldestLast;
        _petalEmitter.emitterMode = kCAEmitterLayerPoints;
        _petalEmitter.emitterShape = kCAEmitterLayerRectangle;
        
        NSMutableArray *cellArray = [NSMutableArray array];
        for (int i = 0; i < 5; i++) {
            CAEmitterCell *petal = [CAEmitterCell emitterCell];
            petal.birthRate = 0.5 + 0.2 * i;
            petal.velocity = 100;
            petal.velocityRange = 100;
            petal.lifetime = 10;
            petal.spin = 0.5;
            petal.emissionLongitude = -M_PI - M_PI_2;
            petal.emissionRange = M_PI_2;
            NSString *str = [NSString stringWithFormat:@"petal%d", arc4random_uniform(3)];
            petal.contents = (__bridge id)[[UIImage imageNamed:str] CGImage];
            NSString *name = [NSString stringWithFormat:@"petal%d", i];
            petal.name = name;
            [cellArray addObject:petal];
        }
        _petalEmitter.emitterCells = cellArray;
        [self.view.layer addSublayer:_petalEmitter];
        
        //太阳按钮点击事件
    }else if (btn.tag == 2) {
        [_sunEmitter removeFromSuperlayer];
        _sunEmitter = nil;
        
        _sunEmitter = [CAEmitterLayer layer];
        _sunEmitter.frame = self.view.bounds;
        _sunEmitter.emitterPosition = CGPointMake(0, 0);
        _sunEmitter.renderMode = kCAEmitterLayerAdditive;
        
        CAEmitterCell *sun = [[CAEmitterCell alloc] init];
        sun.contents = (__bridge id)[UIImage imageNamed:@"petal4"].CGImage;
        sun.birthRate = 800;
        sun.lifetime = 2.0;
        sun.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
        sun.alphaSpeed = -0.4;
        sun.velocity = 50;
        sun.velocityRange = 10;
        sun.emissionRange = M_PI * 2.0;
        _sunEmitter.emitterCells = @[sun];
        [self.view.layer addSublayer:_sunEmitter];
        
        //停止按钮点击事件
    }else if (btn.tag == 3) {
        [_noteEmitter removeFromSuperlayer];
        _noteEmitter = nil;
        [_petalEmitter removeFromSuperlayer];
        _petalEmitter = nil;
        [_sunEmitter removeFromSuperlayer];
        _sunEmitter = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
