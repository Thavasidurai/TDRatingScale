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
    
    NSMutableArray *itemsAry;
    NSMutableArray *itemsXPositionAry;
    
    UIView *containerView;
    UIView *sliderView;
    UIView *meterLine;
    
    id<TDRatingScale>delegate;

}
@property(nonatomic,assign)NSUInteger maximumRating;
@property(nonatomic,assign)NSUInteger minimumRating;
@property(nonatomic,assign)NSUInteger spaceBetweenEachNo;
@property(nonatomic,assign)NSUInteger widthOfEachNo;
@property(nonatomic,assign)NSUInteger heightOfEachNo;
@property(nonatomic,assign)NSUInteger sliderHeight;
@property(nonatomic,strong)id<TDRatingScale>delegate;

-(void)setMaximumRating:(NSUInteger)maximum;
-(void)setMinimumRating:(NSUInteger)minimum;
-(void)setSpaceBetweenEachNo:(NSUInteger)space;
-(void)setWidthOfEachNo:(NSUInteger)width;
-(void)setHeightOfEachNo:(NSUInteger)height;
-(void)setSliderHeight:(NSUInteger)height;
-(void)drawRatingControlWithX:(float)x andY:(float)y;
-(void)drawRatingView;
-(void)createContainerView;
-(void)createSliderView;
-(void)calculateAppropriateSelectorXposition:(UIView *)view;
@end
