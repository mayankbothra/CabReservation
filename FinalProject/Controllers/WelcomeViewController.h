//
//  WelcomeViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;



- (IBAction)loginButton:(id)sender;
- (IBAction)signUpButton:(id)sender;
@end
