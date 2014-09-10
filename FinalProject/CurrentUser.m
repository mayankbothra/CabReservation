//
//  CurrentUser.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/10/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "CurrentUser.h"

@implementation CurrentUser

static CurrentUser *sharedCurrentUser=nil;

@synthesize currentUser;

+ (CurrentUser*) sharedSingleton {
    if(sharedCurrentUser == nil) {
        sharedCurrentUser =[[CurrentUser alloc] init];
    }
    return sharedCurrentUser;
}

- (id) init {
    if(self = [super init]) {
        currentUser=[[UserAccount alloc]init];
    }
    return self;
}

@end
