//
//  CustomerBookViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "CustomerBookViewController.h"
#import "CurrentUser.h"
#import "Person.h"
#import "Bookings.h"


@interface CustomerBookViewController ()

@end

@implementation CustomerBookViewController
@synthesize fromTxt, toTxt, whenTxt;

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fromClicked:(id)sender {

}

-(void)setFromText:(NSString*)fromTextP{
    self.fromTxt.text = fromTextP;
}

- (void)viewB:(UIViewController *)vc EnterMessage:(NSString *)message {
    self.fromTxt.text = message;
}

- (IBAction)bookNowButton:(id)sender {
    
    BOOL isWhen = [self checkIfTextFieldEmpty:whenTxt];
    BOOL empty = TRUE;
    
    if (isWhen == TRUE) {
        NSString *msg = [NSString stringWithFormat:@"Select When to Travel"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        empty = FALSE;
    }
    if(empty == TRUE){
        BOOL isFrom = [self checkIfTextFieldEmpty:fromTxt];
        if (isFrom == TRUE) {
            NSString *msg = [NSString stringWithFormat:@"Select Starting Point"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            empty = FALSE;
        }
    }
    if(empty == TRUE){
        CurrentUser *c = [CurrentUser sharedSingleton];
        PFObject* customer = [Person getPersonByEmail:c.currentUser.person.email];
        NSString* when = whenTxt.text;
        NSString* from = fromTxt.text;
        NSString* to = toTxt.text;
        
        Bookings *booking = [[Bookings alloc]init];
        
        [booking bookNow:customer when:when from:from to:to];
        
        NSString *msg = [NSString stringWithFormat:@"Your Booking is Confirmed"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        whenTxt.text = @"";
        fromTxt.text = @"";
        toTxt.text = @"";
        [alert show];
        
    }
}

-(BOOL) checkIfTextFieldEmpty:(UITextField *)textField {
    if ([textField.text isEqualToString:@""] || textField.text== nil) {
        NSLog(@"TRUE");
        return TRUE;
    } else {
        return FALSE;
    }
}

@end
