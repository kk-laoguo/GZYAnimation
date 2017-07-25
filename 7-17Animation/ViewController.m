//
//  ViewController.m
//  7-17Animation
//
//  Created by 今代科技 on 2017/7/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "ViewController.h"

static NSString * const IDENTI = @"GZYCELLID";


@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView    *tableView;
@property (nonatomic, strong) NSArray               * dataArr;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.backBarButtonItem = item;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@"01 - CALayer的基本操作",
                     @"02 - 时钟效果",
                     @"03 - 心跳效果/转场动画",
                     @"04 - 图形加载动画",
                     @"05 - 图片折叠",
                     @"06 - 音乐震动条/复制层",
                     @"07 - 倒影",
                     @"08 - 雷达效果",
                     @"09 - QQ粘性布局",
                     @"10 - 微博动画",
                     @"11 - 打马赛克"];
    }
    return _dataArr;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:IDENTI];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:IDENTI];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * vc;
    if (indexPath.row == 0) {
        vc = [story instantiateViewControllerWithIdentifier:@"GZYBaseCalayerVc"];
    } else if (indexPath.row == 1) {
        vc = [story instantiateViewControllerWithIdentifier:@"GZYClockVc"];
    } else if (indexPath.row == 2) {
        vc = [story instantiateViewControllerWithIdentifier:@"GZYHeaderBeatVc"];
    } else if (indexPath.row == 3) {
        vc = [story instantiateViewControllerWithIdentifier:@"PictureLodingVc"];
    } else if (indexPath.row == 4) {
        vc = [story instantiateViewControllerWithIdentifier:@"GZYPictureFloldVc"];
    } else if (indexPath.row == 5) {
        vc = [story instantiateViewControllerWithIdentifier:@"GZYMusicVibration"];
    } else if (indexPath.row == 6) {
        vc = [story instantiateViewControllerWithIdentifier:@"GZYReflectionVc"];
        
    }  else if (indexPath.row == 7) {
        vc = [story instantiateViewControllerWithIdentifier:@"RadarViewController"];
    }
    else if (indexPath.row == 9) {
        vc = [story instantiateViewControllerWithIdentifier:@"WeiBoAnimationVc"];
    }
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
