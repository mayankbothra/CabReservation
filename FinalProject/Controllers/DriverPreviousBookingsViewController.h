//
//  DriverPreviousBookingsViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/14/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookings.h"

@interface DriverPreviousBookingsViewController : UITableViewController{
    BOOL success;
    NSMutableArray* bookingList;
    Bookings *booking;
}

@property(nonatomic)BOOL success;
@property(nonatomic)NSMutableArray* bookingList;
@property(nonatomic)Bookings *booking;


@end
