//
//  TDRatingView.h
//  TDRatingControl
//
//  Created by Thavasidurai on 14/02/13.
//  Copyright (c) 2013 JEMS All rights reserved.
//


#import <UIKit/UIKit.h>
@protocol TDRatingScale <NSObject>

@required
- (void) SelectedRating:(NSString *)scale;
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
    
    id<TDRatingScale>delegate;
    
}
@property(nonatomic,assign)NSUInteger maximumRating;
@property(nonatomic,assign)NSUInteger minimumRating;
@property(nonatomic,assign)NSUInteger spaceBetweenEachNo;
@property(nonatomic,assign)NSUInteger widthOfEachNo;
@property(nonatomic,assign)NSUInteger heightOfEachNo;
@property(nonatomic,assign)NSUInteger sliderHeight;
@property(nonatomic,assign)NSUInteger difference;
@property(nonatomic,strong)id<TDRatingScale>delegate;
@property(nonatomic,assign)UIColor *scaleBgColor;
@property(nonatomic,strong)UIColor *arrowColor;
@property(nonatomic,strong)UIColor *disableStateTextColor;
@property(nonatomic,strong)UIColor *selectedStateTextColor;
@property(nonatomic,strong)UIColor *sliderBorderColor;



-(void)setMaximumRating:(NSUInteger)maximum;
-(void)setMinimumRating:(NSUInteger)minimum;
-(void)setSpaceBetweenEachNo:(NSUInteger)space;
-(void)setWidthOfEachNo:(NSUInteger)width;
-(void)setHeightOfEachNo:(NSUInteger)height;
-(void)setSliderHeight:(NSUInteger)height;
-(void)setDifference:(NSUInteger)no;
-(void)drawRatingControlWithX:(float)x andY:(float)y;
-(void)drawRatingView;
-(void)createContainerView;
-(void)createSliderView;
-(void)calculateAppropriateSelectorXposition:(UIView *)view;
-(void)setScaleBgColor:(UIColor *)color;
-(void)setArrowColor:(UIColor *)color;
-(void)setDisableStateTextColor:(UIColor *)color;
-(void)setSelectedStateTextColor:(UIColor *)color;
-(void)setSliderBorderColor:(UIColor *)color;
@end
