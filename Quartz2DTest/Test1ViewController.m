//
//  Test1ViewController.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/16.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "Test1ViewController.h"

@interface Test1ViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) UIView *redView;
@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    
    keyAnima.keyPath=@"position";
    
    CGMutablePathRef path=CGPathCreateMutable();
    
    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
    keyAnima.path=path;
    
    CGPathRelease(path);
    
    keyAnima.removedOnCompletion=NO;
    
    keyAnima.fillMode=kCAFillModeForwards;
    
    keyAnima.duration=5.0;
    
    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    keyAnima.delegate=self;
    
    [_redView.layer addAnimation:keyAnima forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"开始动画");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"开始结束");
}

@end
