//
//  CurrentUser.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/10/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserAccount.h"

@interface CurrentUser : NSObject{
    UserAccount *currentUser;
}

@property(retain,nonatomic)UserAccount *currentUser;
+ (CurrentUser*) sharedSingleton;

@end
