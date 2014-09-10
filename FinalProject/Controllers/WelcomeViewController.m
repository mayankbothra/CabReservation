//
//  WelcomeViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "WelcomeViewController.h"
#import "CustomSegue.h"
#import "CustomUnwindSegue.h"
#import <Parse/Parse.h>


@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

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
    
    
    
//    UIColor* mainColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:7.0/255 green:61.0/255 blue:48.0/255 alpha:1.0f];
    
    NSString* boldFontName = @"Avenir-Black";
    
    self.loginButton.backgroundColor = darkColor;
    self.loginButton.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.loginButton setTitle:@"LOG IN" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];

    self.signUpButton.backgroundColor = [UIColor whiteColor];
    self.signUpButton.titleLabel.font = [UIFont fontWithName:boldFontName size:20.0f];
    [self.signUpButton setTitle:@"SIGN UP" forState:UIControlStateNormal];
    [self.signUpButton setTitleColor:[UIColor colorWithRed:7.0/255 green:61.0/255 blue:48.0/255 alpha:1.0f] forState:UIControlStateNormal];
    [self.signUpButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue isKindOfClass:[CustomSegue class]]) {
        // Set the start point for the animation to center of the button for the animation
        ((CustomSegue *)segue).originatingPoint = self.loginButton.center;
    }
}


- (IBAction)loginButton:(id)sender {
}

- (IBAction)signUpButton:(id)sender {
}




- (IBAction)unwindFromViewController:(UIStoryboardSegue *)sender {
}


// We need to over-ride this method from UIViewController to provide a custom segue for unwinding

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {

    CustomUnwindSegue *segue = [[CustomUnwindSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];

    segue.targetPoint = self.loginButton.center;
    return segue;
}
@end
