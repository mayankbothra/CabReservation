//
//  CustomerHistoryViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "CustomerHistoryViewController.h"

@interface CustomerHistoryViewController ()

@end

@implementation CustomerHistoryViewController
@synthesize openBookingButton, historyButton;
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
    
    self.openBookingButton.backgroundColor = darkColor;
    self.openBookingButton.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.openBookingButton setTitle:@"OPEN BOOKINGS" forState:UIControlStateNormal];
    [self.openBookingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.openBookingButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    
    self.historyButton.backgroundColor = [UIColor whiteColor];
    self.historyButton.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.historyButton setTitle:@"PREVIOUS BOOKINGS" forState:UIControlStateNormal];
    [self.historyButton setTitleColor:[UIColor colorWithRed:7.0/255 green:61.0/255 blue:48.0/255 alpha:1.0f] forState:UIControlStateNormal];
    [self.historyButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openHistoryButton:(id)sender {
}

- (IBAction)historyButton:(id)sender {
}
@end
