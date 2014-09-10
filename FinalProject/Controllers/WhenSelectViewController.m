//
//  WhenSelectViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "WhenSelectViewController.h"
#import "CustomerBookViewController.h"

@interface WhenSelectViewController ()

@end

@implementation WhenSelectViewController
@synthesize datePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"background.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}
-(void)viewWillAppear:(BOOL)animated{
    datePicker.date =
    [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 2 ];
    datePicker.minimumDate =
    [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
}

- (IBAction)saveButton:(id)sender {
    NSDate * dateselected = [datePicker date];
    NSDateFormatter* dtFormatter = [[NSDateFormatter alloc] init];
    [dtFormatter setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
    NSString* when = [dtFormatter stringFromDate:dateselected];
    
    NSArray * arrayOfControllers =  self.navigationController.viewControllers;
    CustomerBookViewController * viewControllerA = [arrayOfControllers objectAtIndex:[arrayOfControllers count]-2];
    viewControllerA.whenTxt.text = when;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)datePickerChanged: (id)sender
{
    if ( [ datePicker.date timeIntervalSinceNow ] < 0 )
        datePicker.date = [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
}
@end
