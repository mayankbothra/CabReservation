//
//  MasterTabBarControllerViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/10/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserAccount.h"

@interface MasterTabBarControllerViewController : UITabBarController{
    UserAccount * userAccount;
}

@property(retain,nonatomic) UserAccount* userAccount;

@end
