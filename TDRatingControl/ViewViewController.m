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
    
    rating = [[TDRatingView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    rating.maximumRating = 10;
    rating.minimumRating = 1;
    rating.spaceBetweenEachNo = 0;
    rating.widthOfEachNo = 30;
    rating.heightOfEachNo = 40;
    rating.sliderHeight = 17;
    [rating drawRatingControlWithX:10 andY:50];
    rating.delegate = self;
    rating.backgroundColor = [UIColor clearColor];
    [self.view addSubview:rating];
    
    resultLbl = [[UILabel alloc] initWithFrame:CGRectMake(110, 200, 100, 100)];
    resultLbl.numberOfLines = 0;
    resultLbl.backgroundColor = [UIColor colorWithRed:27.0f/255 green:135.0f/255 blue:224.0f/255 alpha:1.0];
    resultLbl.textAlignment = UITextAlignmentCenter;
    resultLbl.textColor = [UIColor whiteColor];
    resultLbl.text = @"1";
    resultLbl.layer.shadowColor = [[UIColor blackColor] CGColor];
    resultLbl.font = [UIFont boldSystemFontOfSize:25];
    resultLbl.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    resultLbl.layer.shadowRadius = 2.0;
    resultLbl.layer.shadowOpacity = 0.3;
    resultLbl.layer.masksToBounds = YES;
    resultLbl.layer.cornerRadius = 10.0f;
    resultLbl.userInteractionEnabled = YES;
    [self.view addSubview:resultLbl];


}
- (void) SelectedRating:(NSString *)scale;
{
    
    resultLbl.text = scale;

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
    // Return YES for supported orientations
    return YES;
}

@end
