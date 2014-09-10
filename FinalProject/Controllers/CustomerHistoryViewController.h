//
//  CustomerHistoryViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerHistoryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *openBookingButton;
@property (weak, nonatomic) IBOutlet UIButton *historyButton;
- (IBAction)openHistoryButton:(id)sender;

- (IBAction)historyButton:(id)sender;
@end
