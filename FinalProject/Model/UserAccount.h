//
//  UserAccount.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/8/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface UserAccount : NSObject{
    NSString* userName;
    NSString* password;
    NSString* role;
    Person* person;
}

@property(retain, nonatomic)NSString* userName;
@property(retain, nonatomic)NSString* password;
@property(retain, nonatomic)NSString* role;
@property(retain, nonatomic)Person* person;



-(void)signUp: (NSString*)usernameP password:(NSString*)passwordP fname:(NSString*)fnameP lname:(NSString*)lnameP email:(NSString*)emailP phone:(NSString*)phone;

+(UserAccount*)authenticateUser: (NSString*)usernameP password:(NSString*)passwordP;


@end
