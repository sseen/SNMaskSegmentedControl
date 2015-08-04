//
//  SNMaskSegmentedControl.m
//  
//
//  Created by MSDJ on 15/8/4.
//
//

#import "SNMaskSegmentedControl.h"

@implementation SNMaskSegmentedControl

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
    
}


@end