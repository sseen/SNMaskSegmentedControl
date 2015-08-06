//
//  ViewController.m
//  MaskLayerDemo
//
//  Created by MSDJ on 15/8/3.
//  Copyright (c) 2015年 MSDJ. All rights reserved.
//

#import "ViewController.h"

#include "SNMaskSegmentedControl.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbltop;

@property (nonatomic) CATextLayer *mainMenuCALabel;
@property (nonatomic) UIView *mainMenuLabelOverlay;
@property (nonatomic) UIScrollView *scrollView;

@property (nonatomic) CALayer *left;
@property (nonatomic) CALayer *right;

@property (nonatomic) UILabel *leftLabel;
@property (nonatomic) UILabel *rightLabel;

@property (nonatomic, assign) CGFloat bili;

@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    
//}
//
//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    
//    CAGradientLayer *layer = [CAGradientLayer layer];
//    layer.frame = CGRectMake(0, 0, 20, 10);
//    layer.colors = @[[UIColor redColor]];
//    layer.mask = _lbltop.layer;
//    
//    [self.lbltop.layer addSublayer:layer];
//
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    SNMaskSegmentedControl *seg = [[SNMaskSegmentedControl alloc] initWithFrame:CGRectMake(0, 300, 40, 30)];
    [self.view addSubview:seg];
    
    [self creatLayer];
    
    [self creatText];
    [self change];
    //[NSTimer scheduledTimerWithTimeInterval:10000.0 target:self selector:@selector(change) userInfo:nil repeats:YES];
    
    
//    // create a yellow background
//    UIView *bg = [[UIView alloc] initWithFrame:self.view.bounds];
//    bg.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:bg];
//    
//    // create the layer on top of the yellow background that will be masked
//    CALayer *imageLayer = [CALayer layer];
//    imageLayer.frame = self.view.layer.bounds;
//    imageLayer.backgroundColor = [[UIColor blueColor] CGColor];
//    
//    // create the mask that will be applied to the layer on top of the yellow background
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.fillRule = kCAFillRuleEvenOdd;
//    maskLayer.frame = self.view.frame;
//    
//    // add the paths to sublayers of the mask
//    CGMutablePathRef p1 = CGPathCreateMutable();
//    CGPathMoveToPoint(p1, NULL, 15, 0);
//    CGPathAddArc(p1, NULL, 15, 15, 15, M_PI_2, -M_PI_2, true);
//    
//    //CGPathAddPath(p1, nil, CGPathCreateWithEllipseInRect((CGRect){{80, 40}, {190, 190}}, nil));
//    CGPathAddPath(p1, nil, CGPathCreateWithRect((CGRect){{0, 0}, {100, 30}}, nil));
//    maskLayer.path = p1;
//    
//    // apply the mask to the layer on top of the yellow background
//    imageLayer.mask = maskLayer;
//    [self.view.layer addSublayer:imageLayer];
//    
//    
//    
//    // display the path of the masks the for screenshot
//    CAShapeLayer *pathLayer1 = [CAShapeLayer layer];
//    pathLayer1.path = maskLayer.path;
//    pathLayer1.lineWidth = 2.0;
//    pathLayer1.strokeColor = [UIColor blackColor].CGColor;
//    pathLayer1.fillColor = [UIColor clearColor].CGColor;
//    //[self.view.layer addSublayer:pathLayer1];

}



- (void)creatLayer

{
    
    CALayer *left = [CALayer layer];
    
    left.frame = CGRectMake(100, 100, 200, 50);
    
    left.backgroundColor = [UIColor blueColor].CGColor;
    
    [self.view.layer addSublayer:left];
    
    self.left = left;
    
    
    
    CALayer *right = [CALayer layer];
    
    right.frame = CGRectMake(100, 100, 200, 50);
    
    right.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:right];
    
    self.right = right;
    
}



- (void)creatText

{
    
    UILabel * leftLabel =[[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 50)];
    
    leftLabel.text = @"测试一下测试一下测试";
    
    leftLabel.textColor = [UIColor redColor];
    
    leftLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:leftLabel];
    
    self.leftLabel = leftLabel;
    
    
    
    UILabel * rightLabel =[[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 50)];
    
    rightLabel.text = @"测试一下测试一下测试";
    
    rightLabel.textColor = [UIColor blueColor];
    
    rightLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:rightLabel];
    
    self.rightLabel = rightLabel;
    
}



- (void)change

{
    
    //self.bili = arc4random()%100;
    self.bili = 50;
    
    
    self.left.mask = [CALayer layer];
    
    self.left.mask.backgroundColor = [[UIColor blackColor] CGColor];
    
    self.left.mask.frame = CGRectMake(0, 0, 100+self.bili, 50);
    
    
    
    self.right.mask = [CALayer layer];
    
    self.right.mask.backgroundColor = [[UIColor blackColor ] CGColor];
    
    self.right.mask.frame = CGRectMake(100+self.bili, 0, 100- self.bili, 50);
    
    
    
    self.leftLabel.layer.mask = [CALayer layer];
    
    self.leftLabel.layer.mask.backgroundColor = [[UIColor blackColor] CGColor];
    
    self.leftLabel.layer.mask.frame = CGRectMake(0, 0, 100+self.bili, 50);
    
    
    
    self.rightLabel.layer.mask = [CALayer layer];
    
    self.rightLabel.layer.mask.backgroundColor = [[UIColor blackColor ] CGColor];
    
    self.rightLabel.layer.mask.frame = CGRectMake(100+self.bili, 0, 100- self.bili, 50);
    
}

@end
