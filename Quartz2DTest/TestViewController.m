//
//  TestViewController.m
//  Quartz2DTest
//
//  Created by 黄章成 on 2017/8/16.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "TestViewController.h"
#import "QCLayer.h"

@interface TestViewController ()<CALayerDelegate>
@property (nonatomic, strong) CALayer *layer;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layer = [CALayer layer];
    
    _layer.backgroundColor = [UIColor redColor].CGColor;
    
    _layer.bounds = CGRectMake(0, 0, 100, 100);
    
    // position 决定layer显示在什么位置，而锚点anchorPoint决定layer到底哪个点移动到position位置，默认锚点是（0.5,0.5）。
    _layer.position = CGPointMake(100, 100);
    _layer.anchorPoint = CGPointMake(0, 0);
    
    [self.view.layer addSublayer:_layer];
    
    
    QCLayer *myLayer = [QCLayer layer];
    myLayer.bounds = CGRectMake(0, 0, 200, 100);
    myLayer.position = CGPointMake(100, 220);
    myLayer.anchorPoint = CGPointZero;
    myLayer.cornerRadius = 20;
    myLayer.shadowOffset = CGSizeMake(10, 5);
    myLayer.shadowColor = [UIColor blackColor].CGColor;
    myLayer.shadowOpacity = 0.5;
    myLayer.backgroundColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:myLayer];
    
    // 一定要手动调用setNeedsDisplay方法，才会实现layer内部的drawInContext：方法，从而layer里面画的圆才能显示出来。
    [myLayer setNeedsDisplay];
    
    
    // 第二种方式：设置CALayer的delegate，然后让delegate实现drawLayer:inContext:方法，当CALayer需要绘图时，会调用delegate的drawLayer:inContext:方法进行绘图。
    
    CALayer *myLayer1 = [CALayer layer];
    myLayer1.bounds = CGRectMake(0, 0, 200, 100);
    myLayer1.position = CGPointMake(100, 380);
    myLayer1.anchorPoint = CGPointZero;
    myLayer1.cornerRadius = 20;
    myLayer1.shadowOffset = CGSizeMake(10, 5);
    myLayer1.shadowColor = [UIColor blackColor].CGColor;
    myLayer1.shadowOpacity = 0.5;
    myLayer1.backgroundColor = [UIColor brownColor].CGColor;
    [self.view.layer addSublayer:myLayer1];
    
    // 注意点：不能再将某个UIView设置为CALayer的delegate，因为UIView对象已经是它内部根层的delegate，再次设置为其他层的delegate就会出问题。
    myLayer1.delegate = self; // 让控制器成为layer代理，
    [myLayer1 setNeedsDisplay];
    
    
}

#pragma mark - CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 50, 50));
    
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    CGContextFillPath(ctx);
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 每一个UIView内部都默认关联着一个CALayer，我们可用称这个Layer为Root Layer（根层）
    // 所有的非Root Layer，也就是手动创建的CALayer对象，都存在着隐式动画
    
    // 下面三行注释的代码作用是关闭隐式动画，注意代码必须加在三行之间。
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
    
    _layer.backgroundColor = [UIColor cyanColor].CGColor;
    _layer.bounds = CGRectMake(0, 0, 200, 60);
    
//    [CATransaction commit];
}


@end
