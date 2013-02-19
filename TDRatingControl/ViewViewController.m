//
//  ViewViewController.m
//  TDRatingControl
//
//  Created by Thavasidurai on 14/02/13.
//  Copyright (c) 2013 JEMS All rights reserved.
//


#import "ViewViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation ViewViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Top
    rating = [[TDRatingView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    rating.maximumRating = 10;
    rating.minimumRating = 1;
    rating.spaceBetweenEachNo = 0;
    rating.widthOfEachNo = 30;
    rating.heightOfEachNo = 40;
    rating.sliderHeight = 17;
    rating.difference = 1;
    rating.delegate = self;
    rating.scaleBgColor = [UIColor colorWithRed:27.0f/255 green:135.0f/255 blue:224.0f/255 alpha:1.0];
    rating.arrowColor = [UIColor redColor];
    rating.disableStateTextColor = [UIColor colorWithRed:17.0f/255 green:10.0f/255 blue:36.0f/255 alpha:1.0];
    rating.selectedStateTextColor = [UIColor whiteColor];
    rating.sliderBorderColor = [UIColor whiteColor];
    rating.backgroundColor = [UIColor clearColor];
    [rating drawRatingControlWithX:10 andY:60];
    [self.view addSubview:rating];
    
    //Middle
    rating2 = [[TDRatingView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    rating2.maximumRating = 60;
    rating2.minimumRating = 10;
    rating2.spaceBetweenEachNo = 0;
    rating2.widthOfEachNo = 50;
    rating2.heightOfEachNo = 50;
    rating2.sliderHeight = 22;
    rating2.difference = 10;
    rating2.delegate = self;
    rating2.scaleBgColor = [UIColor colorWithRed:188.0f/255 green:98.0f/255 blue:150.0f/255 alpha:1.0];
    rating2.arrowColor = [UIColor colorWithRed:73.0f/255 green:78.0f/255 blue:100.0f/255 alpha:1.0];
    rating2.disableStateTextColor = [UIColor colorWithRed:40.0f/255 green:38.0f/255 blue:46.0f/255 alpha:1.0];
    rating2.selectedStateTextColor = [UIColor whiteColor];
    rating2.sliderBorderColor = [UIColor whiteColor];
    rating2.backgroundColor = [UIColor clearColor];
    [rating2 drawRatingControlWithX:13 andY:175];
    [self.view addSubview:rating2];
    
    //Bottom
    rating3 = [[TDRatingView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    rating3.maximumRating = 1000;
    rating3.minimumRating = 0;
    rating3.spaceBetweenEachNo = 0;
    rating3.widthOfEachNo = 50;
    rating3.heightOfEachNo = 50;
    rating3.sliderHeight = 22;
    rating3.difference = 200;
    rating3.delegate = self;
    rating3.scaleBgColor = [UIColor colorWithRed:40.0f/255 green:38.0f/255 blue:46.0f/255 alpha:1.0];
    rating3.arrowColor = [UIColor colorWithRed:0.0f/255 green:215.0f/255 blue:255.0f/255 alpha:1.0];
    rating3.disableStateTextColor = [UIColor colorWithRed:202.0f/255 green:183.0f/255 blue:172.0f/255 alpha:1.0];
    rating3.selectedStateTextColor = [UIColor colorWithRed:0.0f/255 green:215.0f/255 blue:255.0f/255 alpha:1.0];
    rating3.sliderBorderColor = [UIColor whiteColor];
    rating3.backgroundColor = [UIColor clearColor];
    [rating3 drawRatingControlWithX:13 andY:300];
    [self.view addSubview:rating3];
    
    
}
- (void) SelectedRating:(NSString *)scale;
{
    
    
    NSLog(@"SelectedRating:::%@",scale);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationMaskPortrait);
}
@end
