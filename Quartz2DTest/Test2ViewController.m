//
//  Test2ViewController.m
//  Quartz2DTest
//
//  Created by hzc on 2018/4/9.
//  Copyright © 2018年 黄章成. All rights reserved.
//

#import "Test2ViewController.h"

@interface Test2ViewController ()
@property (nonatomic, strong) UIView *animateCube;
@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.center = CGPointMake(self.view.center.x, 50);
    [btn addTarget:self action:@selector(dismissClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
    [self animateCubee];
}

- (void)dismissClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)animateCubee {
    
    CGRect targetBounds = (CGRect){CGPointZero,CGSizeMake(200, 200)};
    self.animateCube = [[UIView alloc] initWithFrame:targetBounds];
    _animateCube.center = self.view.center;
//    _animateCube.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:self.animateCube];
    
    UIView *test = [[UIView alloc] initWithFrame:targetBounds];// front
    test.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.25];
    test.layer.transform = CATransform3DTranslate(test.layer.transform, 0, 0, 100);
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"前";
    [lab sizeToFit];
    lab.center = CGPointMake(test.bounds.size.width / 2, test.bounds.size.height / 2);
    [test addSubview:lab];
    
    UIView *test1 = [[UIView alloc] initWithFrame:targetBounds];// back
    test1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    test1.layer.transform = CATransform3DTranslate(test1.layer.transform, 0, 0, -100);
    UIView *test2 = [[UIView alloc] initWithFrame:targetBounds];// left
    test2.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    test2.layer.transform = CATransform3DTranslate(test2.layer.transform, -100, 0, 0);
    test2.layer.transform = CATransform3DRotate(test2.layer.transform, M_PI_2, 0, 1, 0);
    UIView *test3 = [[UIView alloc] initWithFrame:targetBounds];// right
    test3.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.5];
    test3.layer.transform = CATransform3DTranslate(test3.layer.transform, 100, 0, 0);
    test3.layer.transform = CATransform3DRotate(test3.layer.transform, M_PI_2, 0, 1, 0);
    UIView *test4 = [[UIView alloc] initWithFrame:targetBounds];// head
    test4.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    test4.layer.transform = CATransform3DTranslate(test4.layer.transform, 0, 100, 0);
    test4.layer.transform = CATransform3DRotate(test4.layer.transform, M_PI_2, 1, 0, 0);
    UIView *test5 = [[UIView alloc] initWithFrame:targetBounds];// foot
    test5.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
    test5.layer.transform = CATransform3DTranslate(test5.layer.transform, 0, -100, 0);
    test5.layer.transform = CATransform3DRotate(test5.layer.transform, M_PI_2, -1, 0, 0);
    
    [self.animateCube addSubview:test];
    [self.animateCube addSubview:test1];
    [self.animateCube addSubview:test2];
    [self.animateCube addSubview:test3];
    [self.animateCube addSubview:test4];
    [self.animateCube addSubview:test5];
    
//    self.animateCube.transform = CGAffineTransformMakeScale(0.5, 0.5);//缩小一半
    __block CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0/-500;// m34作用是使得图像更有立体感（远小近大的感觉）
    
    // 打开下面代码让方块自动旋转
//    float angle = M_PI / 360;
//
//    self.animateCube.layer.sublayerTransform = transform;
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0/60 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        transform = CATransform3DRotate(transform, angle, 1, 1, 0.5);
        self.animateCube.layer.sublayerTransform = transform;//
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.animateCube addGestureRecognizer:ges];
}

- (void)pan:(UIPanGestureRecognizer *)ges {
    
    CGPoint p = [ges translationInView:self.animateCube];
    CGFloat angel1 = p.x / 30;
    CGFloat angel2 = p.y / 30;
    
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/-500;
    t = CATransform3DRotate(t, angel1, 0, 1, 0);
    t = CATransform3DRotate(t, angel2, 1, 0, 0);
    self.animateCube.layer.sublayerTransform = t;
}



@end
