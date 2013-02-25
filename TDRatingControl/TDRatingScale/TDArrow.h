//
//  TDArrow.h
//  TDRatingControl
//
//  Created by Thavasidurai on 14/02/13.
//  Copyright (c) 2013 JEMS All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TDArrow : UIView
{
    UIColor *arrowCr;
    UIColor *strokeCr;
    BOOL arrow;
}
- (id)initWithFrame:(CGRect)theFrame arrowColor:(UIColor *)arrowColor strokeColor:(UIColor *)strokeColor isUpArrow:(BOOL)arrowType ;

@end
