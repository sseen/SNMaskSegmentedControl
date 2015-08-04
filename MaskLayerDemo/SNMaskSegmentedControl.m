//
//  SNMaskSegmentedControl.m
//  
//
//  Created by MSDJ on 15/8/4.
//
//

#import "SNMaskSegmentedControl.h"
#import "Line.h"

@interface SNMaskSegmentedControl()

@property (nonatomic) Line *line;
@property (nonatomic) NSMutableArray *lengthArray;

@property (nonatomic) CATextLayer *textLayer;
@property (nonatomic) CATextLayer *textLayer2;

@end

@implementation SNMaskSegmentedControl
@synthesize textLayer2=textLayer2, textLayer = textLayer;

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
    
    textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(10, 0, self.frame.size.width, self.frame.size.height);
    textLayer.string = @"活动";
    textLayer.fontSize = 20;
    CGSize textSize = [@"活动" sizeWithFont:[UIFont systemFontOfSize:20]];
    textLayer.frame = CGRectMake(10, 0, textSize.width, textSize.height);
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    textLayer2 = [CATextLayer layer];
    textLayer2.frame = CGRectMake(10, 0, self.frame.size.width, self.frame.size.height);
    textLayer2.string = @"活动";
    textLayer2.fontSize = 20;
    textLayer2.frame = CGRectMake(10, 0, textSize.width, textSize.height);
    textLayer2.foregroundColor = [UIColor blackColor].CGColor;
    textLayer2.contentsScale = [UIScreen mainScreen].scale;
    
    [self.line setNeedsDisplay];
    [self.layer addSublayer:textLayer];
    [self.layer addSublayer:textLayer2];
    
    [self.textLayer setNeedsDisplay];
    //[self.textLayer2 setNeedsDisplay];
    
    
    
    textLayer.mask = [CAShapeLayer layer];
    textLayer.mask.cornerRadius = 15;
    textLayer.mask.backgroundColor = [UIColor blackColor].CGColor;
    textLayer.mask.frame = CGRectMake(0, 0, 100, self.frame.size.height);
    
    textLayer2.mask = [CAShapeLayer layer];
    textLayer2.mask.cornerRadius = 15;
    textLayer2.mask.backgroundColor = [UIColor blackColor].CGColor;
    //textLayer2.mask.frame = CGRectMake(10, 0, 10, self.frame.size.height);
}

- (Line *)line {
    if (!_line) {
        _line = [Line layer];
        _line.frame = CGRectMake(0, 0, 70, self.frame.size.height);
        _line.contentsScale = [UIScreen mainScreen].scale;
    }
    
    return _line;
}

#pragma mark - gesture 
- (void)tapAction:(UITapGestureRecognizer *)ges {
    
}

- (void)panAction:(UIPanGestureRecognizer *)ges {
    CGPoint location = [ges locationInView:self];
    NSLog(@"%f, %f, %f", location.x, location.y, self.frame.size.width-self.line.frame.size.width);
    if (location.x > self.frame.size.width-self.line.frame.size.width) {
        location.x = self.frame.size.width-self.line.frame.size.width;
    }
    textLayer.mask.frame = CGRectMake(location.x, 0, 40-location.x, self.frame.size.height);
    textLayer2.mask.frame = CGRectMake(0, 0, location.x, self.frame.size.height);
    
    self.line.frame = CGRectMake(location.x, 0, 70, self.frame.size.height);
}
@end