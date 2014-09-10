//
//  DriverHistoryViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DriverHistoryViewController : UIViewController
- (IBAction)openBookingButton:(id)sender;
- (IBAction)historyButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *openBookingButton;
@property (weak, nonatomic) IBOutlet UIButton *historyButton;

@end
