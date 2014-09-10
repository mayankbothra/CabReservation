//
//  Person.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Person : NSObject{
    NSString* firstName;
    NSString* lastName;
    NSString* email;
    NSString* phone;
}

@property(retain, nonatomic)NSString* firstName;
@property(retain, nonatomic)NSString* lastName;
@property(retain, nonatomic)NSString* email;
@property(retain, nonatomic)NSString* phone;

+(PFObject*)getPersonByEmail:(NSString*)emailP;

@end
