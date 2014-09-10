//
//  CustomerBookViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerBookViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *whenTxt;
@property (weak, nonatomic) IBOutlet UITextField *fromTxt;
@property (weak, nonatomic) IBOutlet UITextField *toTxt;

- (IBAction)bookNowButton:(id)sender;


@end
