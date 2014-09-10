//
//  DriverJobsViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookings.h"

@interface DriverJobsViewController : UITableViewController{
    NSMutableArray* jobList;
    BOOL success;
    Bookings *booking;
}

@property(nonatomic)NSMutableArray* jobList;
@property(nonatomic)BOOL success;
@property(nonatomic)Bookings *booking;

@end
