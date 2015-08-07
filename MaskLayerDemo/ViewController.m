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
    
    SNMaskSegmentedControl *seg = [[SNMaskSegmentedControl alloc] initWithFrame:CGRectMake(0, 300, 300, 30)];
    [self.view addSubview:seg];
    
}

@end
