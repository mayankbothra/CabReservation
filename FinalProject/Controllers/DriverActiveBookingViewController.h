//
//  DriverActiveBookingViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/14/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookings.h"

@interface DriverActiveBookingViewController : UIViewController{
    CGFloat animatedDistance;
    NSMutableArray* bookingList;
    Bookings* active;
}
@property(nonatomic)Bookings* active;;
@property(nonatomic)NSMutableArray* bookingList;
@property (weak, nonatomic) IBOutlet UITextField *toTxt;
@property (weak, nonatomic) IBOutlet UITextField *fromTxt;
@property (weak, nonatomic) IBOutlet UITextField *whenTxt;
@property (weak, nonatomic) IBOutlet UITextField *fareTxt;
- (IBAction)completeButton:(id)sender;

@end
