//
//  Line.m
//  KYAnimatedPageControl-Demo
//
//  Created by Kitten Yang on 6/11/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.


//相邻小球之间的距离
#define DISTANCE 40 

#import "Line.h"
#import "KYSpringLayerAnimation.h"



@interface Line()


@end

@implementation Line{

    CGFloat initialSelectedLineLength; // 记录上一次选中的长度
    CGFloat lastContentOffsetX;        // 记录上一次的contentOffSet.x

}

#pragma mark -- Initialize

//第一次显示提供默认值
-(id)init{
    
    self = [super init];
    if (self) {

        //属性默认值
        self.ballDiameter = 30.0;
        
    }
    
    return self;
}


//必须重载  drawInContext前必调此方法，需要拷贝上一个状态
-(id)initWithLayer:(Line*)layer{
    self = [super initWithLayer:layer];
    if (self) {
        
        self.ballDiameter = layer.ballDiameter;
        self.masksToBounds = layer.masksToBounds;
    }
    
    return self;
}


#pragma mark -- override Class func
+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqual: @"selectedLineLength"]) {
        return  YES;
    }
    return [super needsDisplayForKey:key];
    
}



//invoke when call setNeedDisplay
-(void)drawInContext:(CGContextRef)ctx{
    
    CGMutablePathRef linePath = CGPathCreateMutable();
    
    CGPathMoveToPoint(linePath, nil, self.ballDiameter/2, self.frame.size.height/2);
    
    //画默认颜色的背景线
    CGPathAddRoundedRect(linePath, nil, CGRectMake(self.ballDiameter/2, self.frame.size.height/2 - self.ballDiameter/2, DISTANCE, self.ballDiameter), 0, 0);

    
    //画2个小圆
    for (NSInteger i = 0; i<2; i++) {
        
        CGRect circleRect = CGRectMake(0 + i*DISTANCE, self.frame.size.height / 2 - self.ballDiameter / 2, self.ballDiameter, self.ballDiameter);
        CGPathAddEllipseInRect(linePath, nil, circleRect);
        
    }
    
    CGContextAddPath(ctx, linePath);
    CGContextSetFillColorWithColor(ctx, [UIColor darkGrayColor].CGColor);
    CGContextFillPath(ctx);
    CGPathRelease(linePath);
   
}



#pragma mark -- length animation
//tap index to scroll
-(void)animateSelectedLineToNewIndex:(NSInteger)newIndex{


}

//pan to scroll
-(void)animateSelectedLineWithScrollView:(UIScrollView *)scrollView{
    

}



#pragma maek --  Animation Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}

@end
