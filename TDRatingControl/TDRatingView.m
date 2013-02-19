//
//  TDRatingView.m
//  TDRatingControl
//
//  Created by Thavasidurai on 14/02/13.
//  Copyright (c) 2013 JEMS All rights reserved.
//

#import "TDRatingView.h"
#import "TDUpArrow.h"
#import "TDDownArrow.h"
#import <QuartzCore/QuartzCore.h>

#define spaceBetweenSliderandRatingView 0
@implementation TDRatingView
@synthesize  maximumRating = maximumRating_,minimumRating = minimumRating_,spaceBetweenEachNo = spaceBetweenEachNo_, difference = difference_;
@synthesize widthOfEachNo = widthOfEachNo_ , heightOfEachNo = heightOfEachNo_ , sliderHeight = sliderHeight_,delegate;
@synthesize scaleBgColor = scaleBgColor_,arrowColor = arrowColor_,disableStateTextColor = disableStateTextColor_,selectedStateTextColor = selectedStateTextColor_,sliderBorderColor = sliderBorderColor_;
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // setup the initial properties of the
        
        
    }
    
    return self;
    
}
#pragma mark - Properties setting
-(void)setMaximumRating:(NSUInteger)maximum
{
    maximumRating_ = maximum;
}
-(void)setMinimumRating:(NSUInteger)minimum
{
    minimumRating_ = minimum;
}
-(void)setSpaceBetweenEachNo:(NSUInteger)space
{
    spaceBetweenEachNo_ = space;
}
-(void)setWidthOfEachNo:(NSUInteger)width
{
    widthOfEachNo_ = width;
}
-(void)setHeightOfEachNo:(NSUInteger)height
{
    heightOfEachNo_ = height;
}
-(void)setSliderHeight:(NSUInteger)height
{
    sliderHeight_ = height;
}
-(void)setScaleBgColor:(UIColor *)color
{
    scaleBgColor_ = color;
}
-(void)setArrowColor:(UIColor *)color
{
    arrowColor_ = color;
}
-(void)setDisableStateTextColor:(UIColor *)color
{
    disableStateTextColor_ = color;
}
-(void)setSelectedStateTextColor:(UIColor *)color
{
    selectedStateTextColor_ = color;
}
-(void)setSliderBorderColor:(UIColor *)color
{
    sliderBorderColor_ = color;
}
-(void)setDifference:(NSUInteger)no
{
    difference_ = no;
}
-(UIColor *)arrowColor
{
    return arrowColor;
}

#pragma mark - Draw Rating Control

-(void)drawRatingControlWithX:(float)x andY:(float)y
{
    
    //    totalNumberOfRatingViews = (maximumRating_ - minimumRating_)+1;
    // formula
    // tn = a+(n-1)d
    //n = 1 + (tn - a)/d
    
    totalNumberOfRatingViews = 1 + ((maximumRating_ - minimumRating_)/difference_);
    
    float width =  totalNumberOfRatingViews *widthOfEachNo_ + (totalNumberOfRatingViews +1)*spaceBetweenEachNo_;
    //here +1 is to add space in front and back
    
    float height = heightOfEachNo_ + (sliderHeight_ *2);
    self.frame = CGRectMake(x, y, width, height);
    
    [self createContainerView];
    
}
-(void)createContainerView
{
    //Container view
    containerView = [[UIView alloc]initWithFrame:CGRectMake(0, sliderHeight_, self.frame.size.width, heightOfEachNo_)];
    containerView.backgroundColor = scaleBgColor_;
    containerView.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    containerView.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    containerView.layer.shadowOpacity = 1.0f;
    containerView.layer.shadowRadius = 1.0f;
    containerView.layer.cornerRadius = heightOfEachNo_/2;
    [self addSubview:containerView];
    
    [self createSliderView];
    
    
    
    
}
-(void)createSliderView
{
    float y =  (heightOfEachNo_  + sliderHeight_) + spaceBetweenSliderandRatingView;
    
    float height = sliderHeight_ - (2*spaceBetweenSliderandRatingView);
    sliderView = [[UIView alloc]initWithFrame:CGRectMake(spaceBetweenEachNo_, 0, widthOfEachNo_, self.frame.size.height)];
    sliderView.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    sliderView.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    sliderView.layer.shadowOpacity = 1.0f;
    sliderView.layer.shadowRadius = 2.0f;
    sliderView.layer.cornerRadius = 2;
    NSLog(@"DoneB4");
    sliderView.layer.borderColor = sliderBorderColor_.CGColor;
    NSLog(@"DoneA6");

    sliderView.layer.borderWidth = 2.0f;
    [self insertSubview:sliderView aboveSubview:containerView];
    
    
    UIView *upArrow = [[UIView alloc]initWithFrame:CGRectMake(0, y, widthOfEachNo_, height)];
    upArrow.backgroundColor = [UIColor clearColor];
    [sliderView addSubview:upArrow];
    
    TDUpArrow *triangleUp = [[TDUpArrow alloc]initWithFrame:CGRectMake(0, 0, upArrow.frame.size.width, upArrow.frame.size.height) arrowColor:arrowColor_ strokeColor:sliderBorderColor_];
    
    [upArrow addSubview:triangleUp];
    
    
    UIView *downArrow = [[UIView alloc]initWithFrame:CGRectMake(0, 0, widthOfEachNo_, height)];
    downArrow.backgroundColor = [UIColor clearColor];
    [sliderView addSubview:downArrow];
    
    TDDownArrow *triangleDown = [[TDDownArrow alloc]initWithFrame:CGRectMake(0, 0, downArrow.frame.size.width, downArrow.frame.size.height) arrowColor:arrowColor_ strokeColor:sliderBorderColor_];
    [sliderView addSubview:triangleDown];
    
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer.minimumNumberOfTouches = 1;
    panRecognizer.delegate = self;
    [sliderView addGestureRecognizer:panRecognizer];
    
    [self drawRatingView];
    
}

-(void)drawRatingView
{
    float itemX = spaceBetweenEachNo_;
    float itemY = 0;
    int differ = minimumRating_;
    //creating items
    itemsAry = [[NSMutableArray alloc]init];
    itemsXPositionAry = [[NSMutableArray alloc]init];
    for (int i =minimumRating_; i<maximumRating_+1; i = i+difference_) {
        
        UILabel *lblMyLable = [[UILabel alloc] initWithFrame:CGRectMake(itemX, itemY, widthOfEachNo_, heightOfEachNo_)];
        lblMyLable.numberOfLines = 0;
        lblMyLable.tag=i;
        lblMyLable.backgroundColor = [UIColor clearColor];
        lblMyLable.textAlignment = UITextAlignmentCenter;
        lblMyLable.text = [NSString stringWithFormat:@"%d",differ];
        differ = differ + difference_;
        
        lblMyLable.textColor = disableStateTextColor_;
        
        lblMyLable.layer.shadowColor = [lblMyLable.textColor CGColor];
        lblMyLable.layer.shadowOffset = CGSizeMake(0.0, 0.0);
        lblMyLable.layer.shadowRadius = 2.0;
        lblMyLable.layer.shadowOpacity = 0.3;
        lblMyLable.layer.masksToBounds = NO;
        lblMyLable.userInteractionEnabled = YES;
        [containerView addSubview:lblMyLable];
        itemX = lblMyLable.frame.origin.x + widthOfEachNo_ + spaceBetweenEachNo_;
        [itemsAry addObject:lblMyLable];
        [itemsXPositionAry addObject:[NSString stringWithFormat:@"%f",lblMyLable.frame.origin.x]];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [singleTap setNumberOfTapsRequired:1];
        [singleTap setNumberOfTouchesRequired:1];
        [lblMyLable addGestureRecognizer:singleTap];
        
    }
    
    UILabel *firstLbl = [itemsAry objectAtIndex:0];
    firstLbl.textColor = selectedStateTextColor_;
    
    
}
-(void)changeTextColor:(UILabel *)myLbl
{
    myLbl.textColor = selectedStateTextColor_;
}
- (void)handleTap:(UIPanGestureRecognizer *)recognizer {
    
    //Accessing tapped view
    float tappedViewX = recognizer.view.frame.origin.x;
    
    //Moving one place to another place animation
    [UIView beginAnimations:@"MoveView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.5f];
    sliderView.frame = CGRectMake(tappedViewX, sliderView.frame.origin.y, sliderView.frame.size.width, sliderView.frame.size.height);
    [UIView commitAnimations];
    
    for(UILabel *mylbl in itemsAry) // Use fast enumeration to iterate through the array
    {
        if (mylbl.textColor == selectedStateTextColor_) {
            
            mylbl.textColor = disableStateTextColor_;
            
        }
    }
    
    
    float selectedViewX =sliderView.frame.origin.x;
    //finding index position of selected view
    NSUInteger index = [itemsXPositionAry indexOfObject:[NSString stringWithFormat:@"%f",selectedViewX]];
    UILabel *myLabel = [itemsAry objectAtIndex:index];
    [self performSelector:@selector(changeTextColor:) withObject:myLabel afterDelay:0.5];
    [delegate SelectedRating:myLabel.text];
    
    
}
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self];
    CGFloat newX = MIN(recognizer.view.frame.origin.x + translation.x, self.frame.size.width - recognizer.view.frame.size.width);
    CGRect newFrame = CGRectMake( newX,recognizer.view.frame.origin.y, recognizer.view.frame.size.width, recognizer.view.frame.size.height);
    recognizer.view.frame = newFrame;
    [recognizer setTranslation:CGPointZero inView:self];
    
    if ([itemsXPositionAry containsObject:[NSString stringWithFormat:@"%f",recognizer.view.frame.origin.x]]) {
        
        
        for(UILabel *mylbl in itemsAry)
        {
            if (mylbl.textColor == selectedStateTextColor_) {
                
                mylbl.textColor = disableStateTextColor_;
                
            }
        }
        
        NSUInteger index = [itemsXPositionAry indexOfObject:[NSString stringWithFormat:@"%f",recognizer.view.frame.origin.x]];
        UILabel * uil = [itemsAry objectAtIndex:index];
        uil.textColor = selectedStateTextColor_;
        
    }
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        [self calculateAppropriateSelectorXposition:recognizer.view];
    }
    
    
    
    
    
}
#pragma mark - Calculate position

-(void)calculateAppropriateSelectorXposition:(UIView *)view
{
    float selectorViewX = view.frame.origin.x;
    float itemXposition = 0;
    float itempreviousXpostion = 0;
    
    for (int i =0; i<[itemsXPositionAry count]; i++) {
        if (i !=0) {
            
            itemXposition = [[itemsXPositionAry objectAtIndex:i]floatValue];
            itempreviousXpostion = [[itemsXPositionAry objectAtIndex:i-1]floatValue];
            
            
        }
        else{
            
            itemXposition = [[itemsXPositionAry objectAtIndex:i]floatValue];
            
            
        }
        if (selectorViewX < itemXposition)
            break;
    }
    
    if (selectorViewX > spaceBetweenEachNo_) {
        
        float nextValue = itemXposition - selectorViewX;
        float previousValue = selectorViewX -itempreviousXpostion;
        
        if (nextValue > previousValue) {
            
            view.frame = CGRectMake(itempreviousXpostion, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
            
        }
        else {
            
            view.frame = CGRectMake(itemXposition, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
            
        }
        
    }
    else{
        //limiting pan gesture x position
        view.frame = CGRectMake(spaceBetweenEachNo_, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        
    }
    
    float selectedViewX =view.frame.origin.x;
    
    for(UILabel *mylbl in itemsAry) // Use fast enumeration to iterate through the array
    {
        if (mylbl.textColor == selectedStateTextColor_) {
            
            mylbl.textColor = disableStateTextColor_;
            
        }
    }
    
    
    //finding index position of selected view
    NSUInteger index = [itemsXPositionAry indexOfObject:[NSString stringWithFormat:@"%f",selectedViewX]];
    UILabel *myLabel = [itemsAry objectAtIndex:index];
    myLabel.textColor = selectedStateTextColor_;
    [delegate SelectedRating:myLabel.text];
    
    
    
    
}

@end
