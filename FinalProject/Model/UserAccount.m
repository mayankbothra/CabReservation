//
//  UserAccount.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "UserAccount.h"
#import <Parse/Parse.h>

@implementation UserAccount

@synthesize userName, password, role, person;


-(void)signUp: (NSString*)usernameP password:(NSString*)passwordP fname:(NSString*)fnameP lname:(NSString*)lnameP email:(NSString*)emailP phone:(NSString*)phoneP{
    
    PFObject *userAccount = [PFObject objectWithClassName:@"UserAccount"];
    userAccount[@"username"] = usernameP;
    userAccount[@"password"] = passwordP;
    userAccount[@"role"] = @"driver";
    
    PFObject *personP = [PFObject objectWithClassName:@"Person"];
    personP[@"fname"] = fnameP;
    personP[@"lname"] = lnameP;
    personP[@"email"] = emailP;
    personP[@"phone"] = phoneP;
    
    userAccount[@"person"] = personP;
    
    [userAccount saveInBackground];
}



+(UserAccount*)authenticateUser: (NSString*)usernameP password:(NSString*)passwordP{
    
    PFQuery *query = [PFQuery queryWithClassName:@"UserAccount"];
    [query whereKey:@"username" equalTo:usernameP];
    [query whereKey:@"password" equalTo:passwordP];
    [query includeKey:@"person"];
    
    NSError *error;
    NSArray *result = [query findObjects:&error];
    
    
    if (result.count == 1) {
        UserAccount *temp = [[UserAccount alloc]init];
        PFObject *pfobj = [result objectAtIndex:0];
        temp.userName = [pfobj objectForKey:@"username"];
        temp.password = [pfobj objectForKey:@"password"];
        temp.role = [pfobj objectForKey:@"role"];
        PFObject* pf = [pfobj objectForKey:@"person"];
        
        Person *tempPerson = [[Person alloc]init];
        tempPerson.firstName = [pf objectForKey:@"fname"];
        tempPerson.lastName = [pf objectForKey:@"lname"];
        tempPerson.email = [pf objectForKey:@"email"];
        tempPerson.phone = [pf objectForKey:@"phone"];
        temp.person = tempPerson;
        
        return temp;
    }
    else {
        return nil;
    }
}


@end
