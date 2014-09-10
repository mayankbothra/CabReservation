//
//  BookingDetailsViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/14/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "BookingDetailsViewController.h"
#import <Parse/Parse.h>
@interface BookingDetailsViewController ()

@end

@implementation BookingDetailsViewController
@synthesize whenTxt, fromTxt, toTxt, fareTxt, booking;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    whenTxt.text = booking.when;
    fromTxt.text = booking.from;
    toTxt.text = booking.to;
    fareTxt.text = booking.fare;
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"background.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
