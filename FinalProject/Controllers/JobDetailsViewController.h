//
//  JobDetailsViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/14/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookings.h"

@interface JobDetailsViewController : UIViewController{
    Bookings *booking;
}

@property(nonatomic)Bookings *booking;
@property (weak, nonatomic) IBOutlet UITextField *whenTxt;
@property (weak, nonatomic) IBOutlet UITextField *fromTxt;
@property (weak, nonatomic) IBOutlet UITextField *toTxt;
- (IBAction)claimButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *claimButtom;
@end
