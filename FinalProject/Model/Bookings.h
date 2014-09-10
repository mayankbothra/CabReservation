//
//  Bookings.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <Parse/Parse.h>

@interface Bookings : NSObject{
    Person* customer;
    NSString* when;
    NSString* from;
    NSString* to;
    NSString* status;
    Person* driver;
    NSString* fare;
    NSString* objectId;

}

@property(nonatomic, retain)Person* customer;
@property(nonatomic, retain)Person* driver;
@property(nonatomic, retain)NSString* when;
@property(nonatomic, retain)NSString* from;
@property(nonatomic, retain)NSString* to;
@property(nonatomic, retain)NSString* status;
@property(nonatomic, retain)NSString* fare;
@property(nonatomic, retain)NSString* objectId;


-(void)bookNow:(PFObject*)customerP when:(NSString*)whenP from:(NSString*)fromP to:(NSString*)toP;

+(NSMutableArray*)getAvailableJobs;

-(void)changeStatus:(NSString*)oid;

-(void)assignDriver:(PFObject*)driverP oid:(NSString*)oid;

+(NSMutableArray*)getOpenBookins:(PFObject*)user;

+(NSMutableArray*)getPreviousBookins:(PFObject*)user;

-(void)cancelBooking:(NSString*)oid;

+(NSMutableArray*)getActiveJobs:(PFObject*)user;

-(void)addFare:(NSString*)fareP oid:(NSString*)oid;

+(NSMutableArray*)getDriverPreviousBookins:(PFObject*)user;



@end
