//
//  DriverJobsViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "DriverJobsViewController.h"
#import "CurrentUser.h"
#import "JobDetailsViewController.h"

@interface DriverJobsViewController ()

@end

@implementation DriverJobsViewController
@synthesize jobList, success, booking;

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

    jobList = [Bookings getAvailableJobs];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [jobList count];
}


//// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"jobs";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cell_id];
    
    Bookings* b = [self.jobList objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell_id];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = b.when;
    cell.detailTextLabel.text = b.from;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    success = TRUE;
    booking = [self.jobList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"jobdetails" sender:self];
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (success == TRUE) {
        JobDetailsViewController *jvc = [segue destinationViewController];
        jvc.booking = self.booking;
    }
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return success;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    jobList = [Bookings getAvailableJobs];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
