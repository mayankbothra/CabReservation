//
//  LoginViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserAccount.h"

@interface LoginViewController : UIViewController{
    CGPoint offset;
    BOOL success;
    BOOL login;
    UserAccount *ua;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@property (nonatomic)BOOL success;
@property (nonatomic)BOOL login;
@property(retain, nonatomic)UserAccount *ua;

- (IBAction)loginButton:(id)sender;
- (IBAction)cancelButton:(id)sender;

@end
