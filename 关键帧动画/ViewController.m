//
//  ViewController.m
//  关键帧动画
//
//  Created by qingyun on 15/11/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) CALayer *baselayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    //1.创建我们的layer
    _baselayer = [CALayer layer];
    //设置layer的位置
    _baselayer.bounds = CGRectMake(0, 0, 50, 50);
    _baselayer.position = CGPointMake(100, 100);
    _baselayer.anchorPoint = CGPointMake(0, 0);
    //设置颜色，border
    _baselayer.borderWidth = 3;
    _baselayer.borderColor = [UIColor purpleColor].CGColor;
    _baselayer.cornerRadius = 25;
    //view.layer 添加layer
    [self.view.layer addSublayer:_baselayer];
    
    //创建关键帧动画 path
    //1.create path
    CGMutablePathRef path = CGPathCreateMutable();
    //2.移动到一个点
    CGPathMoveToPoint(path, NULL, 0, 0);
    //3.画一个圆形
    //CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 200, 200));
    //4.画一个曲线
    CGPathAddCurveToPoint(path, NULL, 20, 600, 350, 10, 375, 660);
    
    //创建关键帧动画的对象
    CAKeyframeAnimation *anmation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //动画时长
    anmation.duration = 2;
    anmation.path = path;
    anmation.repeatCount = MAXFLOAT;
    //释放path
    CGPathRelease(path);
    //将动画添加到图层
    [_baselayer addAnimation:anmation forKey:nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
