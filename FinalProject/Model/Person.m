//
//  Person.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize firstName, lastName, email, phone;

+(PFObject*)getPersonByEmail:(NSString*)emailP{
    PFQuery *query = [PFQuery queryWithClassName:@"Person"];
    [query whereKey:@"email" equalTo:emailP];
    
    NSError* error;
    NSArray* result = [query findObjects:&error];
    
    if(result.count == 1){
        PFObject* pf = [result objectAtIndex:0];
        
        return pf;
    }
    else{
        return nil;
    }
}

@end
