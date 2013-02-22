//
//  TDRatingView.h
//  TDRatingControl
//
//  Created by Thavasidurai on 14/02/13.
//  Copyright (c) 2013 JEMS All rights reserved.
//


#import <UIKit/UIKit.h>
@protocol TDRatingViewDelegate <NSObject>

@required
- (void) selectedRating:(NSString *)scale;
@end

@interface TDRatingView : UIView<UIGestureRecognizerDelegate>
{
    NSUInteger maximumRating;
    NSUInteger minimumRating;
    NSUInteger spaceBetweenEachNo;
    NSUInteger widthOfEachNo;
    NSUInteger heightOfEachNo;
    NSUInteger sliderHeight;
    NSUInteger totalNumberOfRatingViews;
    NSUInteger difference;
    
    NSMutableArray *itemsAry;
    NSMutableArray *itemsXPositionAry;
    
    UIView *containerView;
    UIView *sliderView;
    UIView *meterLine;
    
    UIColor *scaleBgColor;
    UIColor *arrowColor;
    UIColor *disableStateTextColor;
    UIColor *selectedStateTextColor;
    UIColor *sliderBorderColor;
    
    id<TDRatingViewDelegate>delegate;
    
}
@property(nonatomic,assign)NSUInteger maximumRating;
@property(nonatomic,assign)NSUInteger minimumRating;
@property(nonatomic,assign)NSUInteger spaceBetweenEachNo;
@property(nonatomic,assign)NSUInteger widthOfEachNo;
@property(nonatomic,assign)NSUInteger heightOfEachNo;
@property(nonatomic,assign)NSUInteger sliderHeight;
@property(nonatomic,assign)NSUInteger difference;
@property(nonatomic,strong)id<TDRatingViewDelegate>delegate;
@property(nonatomic,strong)UIColor *scaleBgColor;
@property(nonatomic,strong)UIColor *arrowColor;
@property(nonatomic,strong)UIColor *disableStateTextColor;
@property(nonatomic,strong)UIColor *selectedStateTextColor;
@property(nonatomic,strong)UIColor *sliderBorderColor;

-(void)drawRatingControlWithX:(float)x Y:(float)y;
-(void)drawRatingView;
-(void)createContainerView;
-(void)createSliderView;
-(void)calculateAppropriateSelectorXposition:(UIView *)view;
@end
