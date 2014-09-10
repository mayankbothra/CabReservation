//
//  Sign1UpViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/9/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sign1UpViewController : UIViewController{
    CGPoint offset;
    NSString* email;
    NSString* username;
    BOOL success;
    NSString* password;
}
@property (weak, nonatomic) IBOutlet UITextField *firstNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *phoneTxt;
- (IBAction)backButton:(id)sender;
- (IBAction)registerButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *registerButton;
@property(retain, nonatomic)NSString* email;
@property(retain, nonatomic)NSString* username;
@property(retain, nonatomic)NSString* password;
@property(nonatomic)BOOL success;

@end
