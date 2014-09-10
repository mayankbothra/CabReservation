//
//  Bookings.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "Bookings.h"


@implementation Bookings
@synthesize customer, driver, from, when, to, status, objectId, fare;

-(void)bookNow:(PFObject*)customerP when:(NSString*)whenP from:(NSString*)fromP to:(NSString*)toP{
    
    PFObject *booking = [PFObject objectWithClassName:@"Bookings"];
    booking[@"customer"] = customerP;
    booking[@"when"] = whenP;
    booking[@"from"] = fromP;
    booking[@"to"] = toP;
    booking[@"status"] = @"1";
    
    [booking saveInBackground];
}


+(NSMutableArray*)getAvailableJobs{
    PFQuery* query = [PFQuery queryWithClassName:@"Bookings"];
    [query whereKey:@"status" equalTo:@"1"];
    [query includeKey:@"customer"];
    [query orderByAscending:@"when"];

    NSError* error;
    NSArray* result = [query findObjects:&error];
    
    NSMutableArray* jobList = [NSMutableArray arrayWithCapacity:result.count];
    
    if (result.count > 0) {
        
        for (PFObject *object in result) {
                Bookings *booking = [[Bookings alloc]init];
                booking.objectId = [object objectId];
                booking.from = [object objectForKey:@"from"];
                booking.to = [object objectForKey:@"to"];
                booking.when = [object objectForKey:@"when"];
                
                PFObject* p = [object objectForKey:@"customer"];
                
                Person* temp = [[Person alloc]init];
                temp.firstName = [p objectForKey:@"fname"];
                temp.lastName = [p objectForKey:@"lname"];
                temp.email = [p objectForKey:@"email"];
                temp.phone = [p objectForKey:@"phone"];
                
                [jobList addObject:booking];
            }
        }
    return jobList;
}

-(void)changeStatus:(NSString*)oid{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Bookings"];
    [query getObjectInBackgroundWithId:oid block:^(PFObject *book, NSError* error){
        book[@"status"] = @"2";
        [book saveInBackground];
    }];
}

-(void)assignDriver:(PFObject*)driverP oid:(NSString*)oid{
    PFQuery* query = [PFQuery queryWithClassName:@"Bookings"];
    [query getObjectInBackgroundWithId:oid block:^(PFObject *book, NSError* error){
        
        book[@"driver"] = driverP;
        [book saveInBackground];
    }];
}

+(NSMutableArray*)getOpenBookins:(PFObject*)user{
    
    NSArray *statusnumber = @[@"1",@"2"];
    
    PFQuery* query = [PFQuery queryWithClassName:@"Bookings"];
    [query whereKey:@"status" containedIn:statusnumber];
    [query whereKey:@"customer" equalTo:user];
    [query includeKey:@"customer"];
    [query orderByAscending:@"when"];
    
    NSError* error;
    NSArray* result = [query findObjects:&error];
    
    NSMutableArray* bookingList = [NSMutableArray arrayWithCapacity:result.count];
    
    if (result.count > 0) {
        
        for (PFObject *object in result) {
            Bookings *booking = [[Bookings alloc]init];
            booking.objectId = [object objectId];
            booking.from = [object objectForKey:@"from"];
            booking.to = [object objectForKey:@"to"];
            booking.when = [object objectForKey:@"when"];
            
            PFObject* p = [object objectForKey:@"customer"];
            
            Person* temp = [[Person alloc]init];
            temp.firstName = [p objectForKey:@"fname"];
            temp.lastName = [p objectForKey:@"lname"];
            temp.email = [p objectForKey:@"email"];
            temp.phone = [p objectForKey:@"phone"];
            
            [bookingList addObject:booking];
        }
    }
    return bookingList;
}

+(NSMutableArray*)getPreviousBookins:(PFObject *)user{
    
    PFQuery* query = [PFQuery queryWithClassName:@"Bookings"];
    [query whereKey:@"status" equalTo:@"3"];
    [query whereKey:@"customer" equalTo:user];
    [query includeKey:@"customer"];
    [query orderByAscending:@"when"];
    
    NSError* error;
    NSArray* result = [query findObjects:&error];
    
    NSMutableArray* bookingList = [NSMutableArray arrayWithCapacity:result.count];
    
    if (result.count > 0) {
        
        for (PFObject *object in result) {
            Bookings *booking = [[Bookings alloc]init];
            booking.objectId = [object objectId];
            booking.from = [object objectForKey:@"from"];
            booking.to = [object objectForKey:@"to"];
            booking.when = [object objectForKey:@"when"];
            booking.fare = [object objectForKey:@"fare"];
            
            PFObject* p = [object objectForKey:@"customer"];
            
            Person* temp = [[Person alloc]init];
            temp.firstName = [p objectForKey:@"fname"];
            temp.lastName = [p objectForKey:@"lname"];
            temp.email = [p objectForKey:@"email"];
            temp.phone = [p objectForKey:@"phone"];
            
            [bookingList addObject:booking];
        }
    }
    return bookingList;
}

-(void)cancelBooking:(NSString*)oid{
    PFQuery *query = [PFQuery queryWithClassName:@"Bookings"];
    
    [query getObjectInBackgroundWithId:oid block:^(PFObject *book, NSError* error){
        [book deleteInBackground];
    }];
}


+(NSMutableArray*)getActiveJobs:(PFObject*)user{
    
    PFQuery* query = [PFQuery queryWithClassName:@"Bookings"];
    [query whereKey:@"status" equalTo:@"2"];
    [query whereKey:@"driver" equalTo:user];
    [query includeKey:@"driver"];
    [query orderByAscending:@"when"];
    
    NSError* error;
    NSArray* result = [query findObjects:&error];
    
    NSMutableArray* bookingList = [NSMutableArray arrayWithCapacity:result.count];
    
    if (result.count > 0) {
        
        for (PFObject *object in result) {
            Bookings *booking = [[Bookings alloc]init];
            booking.objectId = [object objectId];
            booking.from = [object objectForKey:@"from"];
            booking.to = [object objectForKey:@"to"];
            booking.when = [object objectForKey:@"when"];
            
            PFObject* p = [object objectForKey:@"driver"];
            
            Person* temp = [[Person alloc]init];
            temp.firstName = [p objectForKey:@"fname"];
            temp.lastName = [p objectForKey:@"lname"];
            temp.email = [p objectForKey:@"email"];
            temp.phone = [p objectForKey:@"phone"];
            
            [bookingList addObject:booking];
        }
    }
    return bookingList;
}

-(void)addFare:(NSString*)fareP oid:(NSString*)oid{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Bookings"];
    [query getObjectInBackgroundWithId:oid block:^(PFObject *book, NSError* error){
        book[@"status"] = @"3";
        book[@"fare"] = fareP;
        [book saveInBackground];
    }];
    
}

+(NSMutableArray*)getDriverPreviousBookins:(PFObject*)user{
    PFQuery* query = [PFQuery queryWithClassName:@"Bookings"];
    [query whereKey:@"status" equalTo:@"3"];
    [query whereKey:@"driver" equalTo:user];
    [query includeKey:@"driver"];
    [query orderByAscending:@"when"];
    
    NSError* error;
    NSArray* result = [query findObjects:&error];
    
    NSMutableArray* bookingList = [NSMutableArray arrayWithCapacity:result.count];
    
    if (result.count > 0) {
        
        for (PFObject *object in result) {
            Bookings *booking = [[Bookings alloc]init];
            booking.objectId = [object objectId];
            booking.from = [object objectForKey:@"from"];
            booking.to = [object objectForKey:@"to"];
            booking.when = [object objectForKey:@"when"];
            booking.fare = [object objectForKey:@"fare"];
            
            PFObject* p = [object objectForKey:@"driver"];
            
            Person* temp = [[Person alloc]init];
            temp.firstName = [p objectForKey:@"fname"];
            temp.lastName = [p objectForKey:@"lname"];
            temp.email = [p objectForKey:@"email"];
            temp.phone = [p objectForKey:@"phone"];
            
            [bookingList addObject:booking];
        }
    }
    return bookingList;
}

@end
