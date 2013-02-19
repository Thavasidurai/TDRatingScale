//
//  TDDownArrow.m
//  TDRatingControl
//
//  Created by Thavasidurai on 14/02/13.
//  Copyright (c) 2013 JEMS All rights reserved.
//

#import "TDDownArrow.h"

@implementation TDDownArrow
- (id)initWithFrame:(CGRect)theFrame arrowColor:(UIColor *)arrowColor strokeColor:(UIColor *)strokeColor {
    self = [super initWithFrame:theFrame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        NSLog(@"enter");

        arrowCr =[[UIColor alloc]initWithCGColor:arrowColor.CGColor];
        strokeCr = [[UIColor alloc]initWithCGColor:strokeCr.CGColor];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Get the current graphics context
    // (ie. where the drawing should appear)
    CGContextRef context = UIGraphicsGetCurrentContext();
    //Begin the path
    CGContextBeginPath(context);
    // Starting Point
    CGContextMoveToPoint(context, 0,0);
    CGContextAddLineToPoint(context, rect.size.width, 0);
    CGContextAddLineToPoint(context, rect.size.width/2, rect.size.height);
    // Close the path
    CGContextClosePath(context);
    // Set line width
    CGContextSetLineWidth(context, 2.0);
    // Set colour using RGB intensity values
    
    CGContextSetFillColorWithColor(context, (__bridge CGColorRef)(arrowCr));
    CGContextSetStrokeColorWithColor(context, (__bridge CGColorRef)(strokeCr));
    //Draw on the screen
    CGContextDrawPath(context, kCGPathFillStroke);
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
