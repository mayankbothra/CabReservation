//
//  SignUpViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "SignUpViewController.h"
#import "CustomUnwindSegue.h"
#import "Sign1UpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize emailTxt, usernameTxt, passwordTxt, nextButton, success, signup;

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

- (IBAction)unwindFromViewController:(UIStoryboardSegue *)sender {
}


// We need to over-ride this method from UIViewController to provide a custom segue for unwinding
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    // Instantiate a new CustomUnwindSegue
    CustomUnwindSegue *segue = [[CustomUnwindSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    // Set the target point for the animation to the center of the button in this VC
    segue.targetPoint = self.nextButton.accessibilityFrame.origin;
    return segue;
}

- (IBAction)backButton:(id)sender {
    success = TRUE;
    signup = FALSE;
    [self performSegueWithIdentifier:@"BackFromSignUp" sender:self];
}

- (IBAction)nextButton:(id)sender {
    
    success = FALSE;
    signup = FALSE;
    
    BOOL isEmailEmpty = [self checkIfTextFieldEmpty:emailTxt];
    BOOL empty = TRUE;
    
    if(empty == TRUE){
        if (isEmailEmpty == TRUE) {
            NSString *msg = [NSString stringWithFormat:@"Enter Email"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            empty = FALSE;
        }
    }
    if(empty == TRUE){
        BOOL isUsernameEmpty = [self checkIfTextFieldEmpty:usernameTxt];
        if (isUsernameEmpty == TRUE) {
            NSString *msg = [NSString stringWithFormat:@"Enter Username"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            empty = FALSE;
        }
    }
    if(empty == TRUE){
        BOOL isPasswordEmpty = [self checkIfTextFieldEmpty:passwordTxt];
        if (isPasswordEmpty == TRUE) {
            NSString *msg = [NSString stringWithFormat:@"Enter Password"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            empty = FALSE;
        }
    }
    if(empty == TRUE){
        success = TRUE;
        signup = TRUE;
        [self performSegueWithIdentifier:@"SignUp1Segue" sender:self];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return success;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(success == TRUE && signup == TRUE){
        Sign1UpViewController *svc = [segue destinationViewController];
        svc.email = self.emailTxt.text;
        svc.username = self.usernameTxt.text;
        svc.password = self.passwordTxt.text;
    }
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
