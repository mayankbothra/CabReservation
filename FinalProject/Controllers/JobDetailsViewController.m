//
//  JobDetailsViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/14/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "JobDetailsViewController.h"
#import "CurrentUser.h"
#import <Parse/Parse.h>

@interface JobDetailsViewController ()

@end

@implementation JobDetailsViewController
@synthesize booking, whenTxt, fromTxt, toTxt;

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"background.png"]];
    
    UIColor* darkColor = [UIColor colorWithRed:7.0/255 green:61.0/255 blue:48.0/255 alpha:1.0f];
    
    NSString* boldFontName = @"Avenir-Black";
    
    self.claimButtom.backgroundColor = darkColor;
    self.claimButtom.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.claimButtom setTitle:@"CLAIM JOB" forState:UIControlStateNormal];
    [self.claimButtom setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.claimButtom setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    whenTxt.text = booking.when;
    fromTxt.text = booking.from;
    toTxt.text = booking.to;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)claimButton:(id)sender {
    
    CurrentUser *c = [CurrentUser sharedSingleton];
    PFObject* driver = [Person getPersonByEmail:c.currentUser.person.email];
    
    [booking changeStatus:booking.objectId];
    [booking assignDriver:driver oid:booking.objectId];
    
    NSString *msg = [NSString stringWithFormat:@"Job Claimed!!!!!"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
