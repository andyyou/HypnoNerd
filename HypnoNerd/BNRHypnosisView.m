//
//  BNRHypnosisView.m
//  HypnoNerd
//
//  Created by AndyYou on 2014/6/25.
//  Copyright (c) 2014年 AndyYou. All rights reserved.
//

#import "BNRHypnosisView.h"
@interface BNRHypnosisView() <UIScrollViewDelegate>
#pragma mark - interface and delegate

@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
        fido = @"fido";
        _fido = @"_fido";
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2;
    center.y = bounds.origin.y + bounds.size.height / 2;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0 endAngle:M_PI * 2  clockwise:YES];
    }
    path.lineWidth = 10.0;
    [self.circleColor setStroke];
    [path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched", self);
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = color;
    // 測試如果 fido, _fido instance variable 都有的時候先吃 _fido.
    NSLog(@"%@", [self valueForKey:@"fido"]);
}

#pragma mark - properties methods
-(void)setCircleColor:(UIColor *)circleColor{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
