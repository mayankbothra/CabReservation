//
//  WhenSelectViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WhenSelectViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)saveButton:(id)sender;

@end
