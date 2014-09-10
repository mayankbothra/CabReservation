//
//  Sign1UpViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/9/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "Sign1UpViewController.h"
#import "CustomUnwindSegue.h"
#import "UserAccount.h"

@interface Sign1UpViewController ()

@end

@implementation Sign1UpViewController

@synthesize firstNameTxt, lastNameTxt, phoneTxt, registerButton, email, username, password, success;

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

- (IBAction)backButton:(id)sender {
    success = TRUE;
    [self performSegueWithIdentifier:@"BackToSign" sender:self];
}

- (IBAction)registerButton:(id)sender {
    
    BOOL isFNameEmpty = [self checkIfTextFieldEmpty:firstNameTxt];
    BOOL empty = TRUE;
    success = FALSE;
    
    
    if (isFNameEmpty == TRUE) {
        NSString *msg = [NSString stringWithFormat:@"Enter First Name"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        empty = FALSE;
    }
    if(empty == TRUE){
        BOOL isLNameEmpty = [self checkIfTextFieldEmpty:lastNameTxt];
        if (isLNameEmpty == TRUE) {
            NSString *msg = [NSString stringWithFormat:@"Enter Last Name"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            empty = FALSE;
        }
    }
    if(empty == TRUE){
        BOOL isPhoneEmpty = [self checkIfTextFieldEmpty:phoneTxt];
        if (isPhoneEmpty == TRUE) {
            NSString *msg = [NSString stringWithFormat:@"Enter Phone Number"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            empty = FALSE;
        }
    }
    if(empty == TRUE){
        UserAccount* ua = [[UserAccount alloc]init];
        [ua signUp:username password:password fname:firstNameTxt.text lname:lastNameTxt.text email:email phone:phoneTxt.text];
        NSString *msg = [NSString stringWithFormat:@"Thank You for Joining"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        success = TRUE;
        
        [self performSegueWithIdentifier:@"RegisterButton" sender:self];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return success;
}

- (IBAction)unwindFromViewController:(UIStoryboardSegue *)sender {
}


// We need to over-ride this method from UIViewController to provide a custom segue for unwinding
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    // Instantiate a new CustomUnwindSegue
    CustomUnwindSegue *segue = [[CustomUnwindSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    // Set the target point for the animation to the center of the button in this VC
    segue.targetPoint = self.registerButton.accessibilityFrame.origin;
    return segue;
}

- (BOOL)textFieldShouldReturn:textField
{
	// the user pressed the "Done" button, so dismiss the keyboard
	[textField resignFirstResponder];
	return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
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
