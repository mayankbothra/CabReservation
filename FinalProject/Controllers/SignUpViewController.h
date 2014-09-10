//
//  SignUpViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController{
    CGPoint offset;
    BOOL success;
    BOOL signup;
}
- (IBAction)backButton:(id)sender;
- (IBAction)nextButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *usernameTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property(nonatomic)BOOL success;
@property(nonatomic)BOOL signup;

@end
