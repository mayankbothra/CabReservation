//
//  BookingDetailsViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/14/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookings.h"
@interface BookingDetailsViewController : UIViewController{
    Bookings* booking;
}
@property(nonatomic)Bookings* booking;
@property (weak, nonatomic) IBOutlet UITextField *whenTxt;
@property (weak, nonatomic) IBOutlet UITextField *fromTxt;
@property (weak, nonatomic) IBOutlet UITextField *toTxt;
@property (weak, nonatomic) IBOutlet UITextField *fareTxt;

@end
