//
//  SNMaskSegmentedControl.m
//  
//
//  Created by MSDJ on 15/8/4.
//
//

#import "SNMaskSegmentedControl.h"
#import "Line.h"

float layerWidth = 60;

@interface SNMaskSegmentedControl()

@property (nonatomic) Line *line;
@property (nonatomic) NSMutableArray *lengthArray;

@property (nonatomic) CATextLayer *textLayer;
@property (nonatomic) CATextLayer *textLayer2;
@property (nonatomic) CATextLayer *textLayer3;

@end

@implementation SNMaskSegmentedControl
@synthesize textLayer2=textLayer2, textLayer = textLayer, textLayer3 = textLayer3;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
        
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [self.layer addSublayer:self.line];
    
    float padding = 100;
    
    textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(padding, 0, self.frame.size.width, self.frame.size.height);
    textLayer.string = @"活动";
    textLayer.fontSize = 20;
    CGSize textSize = [@"活动" sizeWithFont:[UIFont systemFontOfSize:20]];
    textLayer.frame = CGRectMake(padding, 0, textSize.width, textSize.height);
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    textLayer2 = [CATextLayer layer];
    textLayer2.frame = CGRectMake(padding, 0, self.frame.size.width, self.frame.size.height);
    textLayer2.string = @"活动";
    textLayer2.fontSize = 20;
    textLayer2.frame = CGRectMake(padding, 0, textSize.width, textSize.height);
    textLayer2.foregroundColor = [UIColor blackColor].CGColor;
    textLayer2.contentsScale = [UIScreen mainScreen].scale;
    
    textLayer3 = [CATextLayer layer];
    textLayer3.frame = CGRectMake(padding, 0, self.frame.size.width, self.frame.size.height);
    textLayer3.string = @"活动";
    textLayer3.fontSize = 20;
    textLayer3.frame = CGRectMake(padding, 0, textSize.width, textSize.height);
    textLayer3.foregroundColor = [UIColor blackColor].CGColor;
    textLayer3.contentsScale = [UIScreen mainScreen].scale;
    
    [self.line setNeedsDisplay];
    [self.layer addSublayer:textLayer];
    [self.layer addSublayer:textLayer2];
    [self.layer addSublayer:textLayer3];
    
    [self.textLayer setNeedsDisplay];
    
    textLayer.mask = [CAShapeLayer layer];
    textLayer.mask.cornerRadius = 15;
    textLayer.mask.backgroundColor = [UIColor blackColor].CGColor;
    textLayer.mask.frame = CGRectMake(-layerWidth, 0, layerWidth, self.frame.size.height);
    
    
    CAShapeLayer *blackMask = [CAShapeLayer layer];
    blackMask.fillRule = kCAFillRuleEvenOdd;
    //blackMask.backgroundColor = [UIColor blackColor].CGColor;
    blackMask.frame = CGRectMake(-15, 0, layerWidth, self.frame.size.height);
    
    CGMutablePathRef p1 = CGPathCreateMutable();
    CGPathMoveToPoint(p1, NULL, 0, 0);
    CGPathAddArc(p1, NULL, 0, 15, 15, M_PI_2, -M_PI_2, true);
    CGPathAddPath(p1, nil, CGPathCreateWithRect((CGRect){{0, 0}, {layerWidth, 30}}, nil));
    blackMask.path = p1;
    
    textLayer2.mask = blackMask;
    
    // 3
    CAShapeLayer *blackMask3 = [CAShapeLayer layer];
    blackMask3.fillRule = kCAFillRuleEvenOdd;
    blackMask3.frame = CGRectMake(-layerWidth, 0, layerWidth, self.frame.size.height);
    
    CGMutablePathRef p3 = CGPathCreateMutable();
    CGPathMoveToPoint(p3, NULL, 0, 0);
    CGPathAddArc(p3, NULL, 0, 15, 15, -M_PI_2, M_PI_2, true);
    CGPathAddPath(p3, nil, CGPathCreateWithRect((CGRect){{- layerWidth , 0}, {layerWidth, 30}}, nil));
    blackMask3.path = p3;
    
    textLayer3.mask = blackMask3;
}

- (Line *)line {
    if (!_line) {
        _line = [[Line alloc]init];
        _line.frame = CGRectMake(0, 0, 60, self.frame.size.height);
        _line.contentsScale = [UIScreen mainScreen].scale;
    }
    
    return _line;
}

#pragma mark - gesture 
- (void)tapAction:(UITapGestureRecognizer *)ges {
}

- (void)panAction:(UIPanGestureRecognizer *)ges {
    CGPoint location = [ges locationInView:self];
    float padding = 100;
    float fastRight = padding + 38 + 15;//活动的width
    float nowx = location.x ;
    float lineX = self.line.frame.origin.x + self.line.frame.size.width;
    NSLog(@"%f, %f, %f, %f", location.x, self.line.frame.origin.x, location.y, lineX);
    
    if (nowx > self.frame.size.width-self.line.frame.size.width) {
        location.x = self.frame.size.width-self.line.frame.size.width + padding;
    }
    
    if ( lineX>= 100 && lineX < fastRight) {
        textLayer.mask.frame = CGRectMake(-layerWidth+lineX-padding, 0, layerWidth, self.frame.size.height);
        textLayer2.mask.frame = CGRectMake(lineX-padding-15, 0, layerWidth, self.frame.size.height);
    }else if (lineX >= fastRight && lineX < fastRight + 38 + 15) {
        NSLog(@"---");
        textLayer.mask.frame = CGRectMake(lineX-fastRight-15, 0, layerWidth, self.frame.size.height);
        textLayer3.mask.frame = CGRectMake(lineX-fastRight+7 , 0, layerWidth, self.frame.size.height);
    }
    
    self.line.frame = CGRectMake(nowx, 0, 60, self.frame.size.height);
    
}
@end