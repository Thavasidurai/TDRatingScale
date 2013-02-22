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
    rating1 = nil;
    rating2 = nil;
    rating3 = nil;

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Top
    rating1 = [[TDRatingView alloc]init];
    rating1.delegate = self;
    [rating1 drawRatingControlWithX:10 Y:60];
    [self.view addSubview:rating1];
    
    //Middle
    rating2 = [[TDRatingView alloc]init];
    rating2.maximumRating = 60;
    rating2.minimumRating = 10;
    rating2.widthOfEachNo = 50;
    rating2.heightOfEachNo = 50;
    rating2.sliderHeight = 22;
    rating2.difference = 10;
    rating2.delegate = self;
    rating2.scaleBgColor = [UIColor colorWithRed:188.0f/255 green:98.0f/255 blue:150.0f/255 alpha:1.0];
    rating2.arrowColor = [UIColor colorWithRed:73.0f/255 green:78.0f/255 blue:100.0f/255 alpha:1.0];
    rating2.disableStateTextColor = [UIColor colorWithRed:40.0f/255 green:38.0f/255 blue:46.0f/255 alpha:1.0];
    [rating2 drawRatingControlWithX:13 Y:175];
    [self.view addSubview:rating2];
    
    //Bottom
    rating3 = [[TDRatingView alloc]init];
    rating3.maximumRating = 1000;
    rating3.minimumRating = 0;
    rating3.widthOfEachNo = 50;
    rating3.heightOfEachNo = 50;
    rating3.sliderHeight = 22;
    rating3.difference = 200;
    rating3.delegate = self;
    rating3.scaleBgColor = [UIColor colorWithRed:40.0f/255 green:38.0f/255 blue:46.0f/255 alpha:1.0];
    rating3.arrowColor = [UIColor colorWithRed:0.0f/255 green:215.0f/255 blue:255.0f/255 alpha:1.0];
    rating3.disableStateTextColor = [UIColor colorWithRed:202.0f/255 green:183.0f/255 blue:172.0f/255 alpha:1.0];
    [rating3 drawRatingControlWithX:13 Y:300];
    [self.view addSubview:rating3];
    
    
}
- (void) selectedRating:(NSString *)scale;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
