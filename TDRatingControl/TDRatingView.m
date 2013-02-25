//
//  TDRatingView.m
//  TDRatingControl
//
//  Created by Thavasidurai on 14/02/13.
//  Copyright (c) 2013 JEMS All rights reserved.
//

#import "TDRatingView.h"
#import "TDArrow.h"
#import <QuartzCore/QuartzCore.h>

#define spaceBetweenSliderandRatingView 0
@implementation TDRatingView
@synthesize  maximumRating ,minimumRating,spaceBetweenEachNo, difference;
@synthesize widthOfEachNo, heightOfEachNo, sliderHeight,delegate;
@synthesize scaleBgColor,arrowColor,disableStateTextColor,selectedStateTextColor,sliderBorderColor;


- (id)init {
    self = [super init];
    if (self) {
        
        //Default Properties
        self.maximumRating = 10;
        self.minimumRating = 1;
        self.spaceBetweenEachNo = 0;
        self.widthOfEachNo = 30;
        self.heightOfEachNo = 40;
        self.sliderHeight = 17;
        self.difference = 1;
        self.scaleBgColor = [UIColor colorWithRed:27.0f/255 green:135.0f/255 blue:224.0f/255 alpha:1.0];
        self.arrowColor = [UIColor redColor];
        self.disableStateTextColor = [UIColor colorWithRed:17.0f/255 green:10.0f/255 blue:36.0f/255 alpha:1.0];
        self.selectedStateTextColor = [UIColor whiteColor];
        self.sliderBorderColor = [UIColor whiteColor];

    }
    return self;
}

#pragma mark - Draw Rating Control

-(void)drawRatingControlWithX:(float)x Y:(float)y;
{
    
    // formula
    // tn = a+(n-1)d
    //n = 1 + (tn - a)/d
    
    totalNumberOfRatingViews = 1 + ((self.maximumRating - self.minimumRating)/self.difference);
    
    float width =  totalNumberOfRatingViews *self.widthOfEachNo + (totalNumberOfRatingViews +1)*self.spaceBetweenEachNo;
    //here +1 is to add space in front and back
    
    float height = self.heightOfEachNo + (self.sliderHeight *2);
    self.frame = CGRectMake(x, y, width, height);
    
    [self createContainerView];
    
}
-(void)createContainerView
{
    //Container view
    containerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.sliderHeight, self.frame.size.width, self.heightOfEachNo)];
    containerView.backgroundColor = self.scaleBgColor;
    containerView.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    containerView.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    containerView.layer.shadowOpacity = 1.0f;
    containerView.layer.shadowRadius = 1.0f;
    containerView.layer.cornerRadius = self.heightOfEachNo/2;
    [self addSubview:containerView];
    
    [self createSliderView];
    
}
-(void)createSliderView
{
    float y =  (self.heightOfEachNo  + self.sliderHeight) + spaceBetweenSliderandRatingView;
    
    float height = self.sliderHeight - (2*spaceBetweenSliderandRatingView);
    sliderView = [[UIView alloc]initWithFrame:CGRectMake(self.spaceBetweenEachNo, 0, self.widthOfEachNo, self.frame.size.height)];
    sliderView.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    sliderView.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    sliderView.layer.shadowOpacity = 1.0f;
    sliderView.layer.shadowRadius = 2.0f;
    sliderView.layer.cornerRadius = 2;
    sliderView.layer.borderColor = [self.sliderBorderColor CGColor];
    
    sliderView.layer.borderWidth = 2.0f;
    [self insertSubview:sliderView aboveSubview:containerView];
    
    
    UIView *upArrow = [[UIView alloc]initWithFrame:CGRectMake(0, y, self.widthOfEachNo, height)];
    upArrow.backgroundColor = [UIColor clearColor];
    [sliderView addSubview:upArrow];
    
    TDArrow *triangleUp = [[TDArrow alloc]initWithFrame:CGRectMake(0, 0, upArrow.frame.size.width, upArrow.frame.size.height) arrowColor:self.arrowColor strokeColor:self.sliderBorderColor isUpArrow:YES];
    [upArrow addSubview:triangleUp];
    
    
    UIView *downArrow = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.widthOfEachNo, height)];
    downArrow.backgroundColor = [UIColor clearColor];
    [sliderView addSubview:downArrow];
    
    TDArrow *triangleDown = [[TDArrow alloc]initWithFrame:CGRectMake(0, 0, upArrow.frame.size.width, upArrow.frame.size.height) arrowColor:self.arrowColor strokeColor:self.sliderBorderColor isUpArrow:NO];
    [sliderView addSubview:triangleDown];
    
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer.minimumNumberOfTouches = 1;
    panRecognizer.delegate = self;
    [sliderView addGestureRecognizer:panRecognizer];
    
    [self drawRatingView];
    
}

-(void)drawRatingView
{
    float itemX = self.spaceBetweenEachNo;
    float itemY = 0;
    int differ = self.minimumRating;
    //creating items
    itemsAry = [NSMutableArray new];
    itemsXPositionAry = [NSMutableArray new];
    for (int i =self.minimumRating; i<self.maximumRating+1; i = i+self.difference) {
        
        UILabel *lblMyLabel = [[UILabel alloc] initWithFrame:CGRectMake(itemX, itemY, self.widthOfEachNo, self.heightOfEachNo)];
        lblMyLabel.numberOfLines = 0;
        lblMyLabel.tag=i;
        lblMyLabel.backgroundColor = [UIColor clearColor];
        lblMyLabel.textAlignment = UITextAlignmentCenter;
        lblMyLabel.text = [NSString stringWithFormat:@"%d",differ];
        differ = differ + self.difference;
        
        lblMyLabel.textColor = self.disableStateTextColor;
        
        lblMyLabel.layer.shadowColor = [lblMyLabel.textColor CGColor];
        lblMyLabel.layer.shadowOffset = CGSizeMake(0.0, 0.0);
        lblMyLabel.layer.shadowRadius = 2.0;
        lblMyLabel.layer.shadowOpacity = 0.3;
        lblMyLabel.layer.masksToBounds = NO;
        lblMyLabel.userInteractionEnabled = YES;
        [containerView addSubview:lblMyLabel];
        itemX = lblMyLabel.frame.origin.x + self.widthOfEachNo + self.spaceBetweenEachNo;
        [itemsAry addObject:lblMyLabel];
        [itemsXPositionAry addObject:[NSString stringWithFormat:@"%f",lblMyLabel.frame.origin.x]];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [singleTap setNumberOfTapsRequired:1];
        [singleTap setNumberOfTouchesRequired:1];
        [lblMyLabel addGestureRecognizer:singleTap];
        
    }
    
    UILabel *firstLbl = [itemsAry objectAtIndex:0];
    firstLbl.textColor = self.selectedStateTextColor;
    
    
}
-(void)changeTextColor:(UILabel *)myLbl
{
    myLbl.textColor = self.selectedStateTextColor;
}
- (void)handleTap:(UIPanGestureRecognizer *)recognizer {
    
    //Accessing tapped view
    float tappedViewX = recognizer.view.frame.origin.x;
    
    //Moving one place to another place animation
    [UIView beginAnimations:@"MoveView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.5f];
    CGRect sliderFrame = sliderView.frame;
    sliderFrame.origin.x = tappedViewX;
    sliderView.frame = sliderFrame;
    [UIView commitAnimations];
    
    for(UILabel *mylbl in itemsAry) // Use fast enumeration to iterate through the array
    {
        if (mylbl.textColor == self.selectedStateTextColor) {
            
            mylbl.textColor = self.disableStateTextColor;
            
        }
    }
    
    
    float selectedViewX =sliderView.frame.origin.x;
    //finding index position of selected view
    NSUInteger index = [itemsXPositionAry indexOfObject:[NSString stringWithFormat:@"%f",selectedViewX]];
    UILabel *myLabel = [itemsAry objectAtIndex:index];
    [self performSelector:@selector(changeTextColor:) withObject:myLabel afterDelay:0.5];
    [delegate selectedRating:myLabel.text];
    
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
            if (mylbl.textColor == self.selectedStateTextColor) {
                
                mylbl.textColor = self.disableStateTextColor;
                
            }
        }
        
        NSUInteger index = [itemsXPositionAry indexOfObject:[NSString stringWithFormat:@"%f",recognizer.view.frame.origin.x]];
        UILabel * uil = [itemsAry objectAtIndex:index];
        uil.textColor = self.selectedStateTextColor;
        
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
    
    if (selectorViewX > self.spaceBetweenEachNo) {
        
        float nextValue = itemXposition - selectorViewX;
        float previousValue = selectorViewX -itempreviousXpostion;
        
        if (nextValue > previousValue) {
                        
            CGRect viewFrame = view.frame;
            viewFrame.origin.x = itempreviousXpostion;
            view.frame = viewFrame;

            
        }
        else {
                        
            CGRect viewFrame = view.frame;
            viewFrame.origin.x = itemXposition;
            view.frame = viewFrame;

            
        }
        
    }
    else{
        //limiting pan gesture x position        
        CGRect viewFrame = view.frame;
        viewFrame.origin.x = self.spaceBetweenEachNo;
        view.frame = viewFrame;

        
    }
    
    float selectedViewX =view.frame.origin.x;
    
    for(UILabel *mylbl in itemsAry) // Use fast enumeration to iterate through the array
    {
        if (mylbl.textColor == self.selectedStateTextColor) {
            
            mylbl.textColor = self.disableStateTextColor;
            
        }
    }
    
    //finding index position of selected view
    NSUInteger index = [itemsXPositionAry indexOfObject:[NSString stringWithFormat:@"%f",selectedViewX]];
    UILabel *myLabel = [itemsAry objectAtIndex:index];
    myLabel.textColor = self.selectedStateTextColor;
    [delegate selectedRating:myLabel.text];
    
    
    
    
}

@end
