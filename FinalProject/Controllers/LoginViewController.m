//
//  LoginViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "LoginViewController.h"
#import "CustomUnwindSegue.h"
#import "CurrentUser.h"
#import "MasterTabBarControllerViewController.h"
#import "MasterDriverViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize loginButton, cancelButton, usernameTxt, passwordTxt, success, login, ua;

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

- (IBAction)loginButton:(id)sender {
    
    success = FALSE;
    login = FALSE;
    
    BOOL isUsernameEmpty = [self checkIfTextFieldEmpty:usernameTxt];
    BOOL empty = TRUE;
    
    
    if (isUsernameEmpty == TRUE) {
        NSString *msg = [NSString stringWithFormat:@"Enter Username"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        empty = FALSE;
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
        ua = [UserAccount authenticateUser:usernameTxt.text password:passwordTxt.text];
        
        if(ua == nil){
            NSString *msg = [NSString stringWithFormat:@"Invalid Username or Password"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else{
            success = TRUE;
            login = TRUE;
            CurrentUser *activeUser = [CurrentUser sharedSingleton];
            activeUser.currentUser = ua;
            
            if([self.ua.role isEqualToString:@"customer"]){
                [self performSegueWithIdentifier:@"Login" sender:self];
            }
            else{
                [self performSegueWithIdentifier:@"DriverRole" sender:self];
            }
        
        }
    }
}

- (IBAction)cancelButton:(id)sender {
    success = TRUE;
    login = FALSE;
    
    [self performSegueWithIdentifier:@"Cancel" sender:self];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return success;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if(success ==TRUE && login == TRUE){
        // Logic to display no of Tabs based on Role
        if([self.ua.role isEqualToString:@"customer"]){
            MasterTabBarControllerViewController *masterTabViewController = [segue destinationViewController];
            masterTabViewController.userAccount = self.ua;
//            NSMutableArray *vcArray = [NSMutableArray arrayWithArray:masterTabViewController.viewControllers];
//            NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSetWithIndex:0];
//            [vcArray removeObjectsAtIndexes:indexSet];
        }else{
            MasterDriverViewController *mdvc = [segue destinationViewController];
            mdvc.userAccount = self.ua;
//            NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSetWithIndex:1];
//            [vcArray removeObjectsAtIndexes:indexSet];
        }
        
//        [masterTabViewController setViewControllers:vcArray animated:YES];
    }
}

- (IBAction)unwindFromViewController:(UIStoryboardSegue *)sender {
}


// We need to over-ride this method from UIViewController to provide a custom segue for unwinding

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {

    CustomUnwindSegue *segue = [[CustomUnwindSegue alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];

    segue.targetPoint = self.loginButton.accessibilityFrame.origin;
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
