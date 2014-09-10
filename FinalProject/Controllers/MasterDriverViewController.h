//
//  MasterDriverViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserAccount.h"

@interface MasterDriverViewController : UITabBarController{
    UserAccount * userAccount;
}

@property(retain,nonatomic) UserAccount* userAccount;


@end
