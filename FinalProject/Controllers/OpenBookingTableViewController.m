//
//  OpenBookingTableViewController.m
//  FinalProject
//
//  Created by Mayank Bothra on 12/14/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import "OpenBookingTableViewController.h"
#import "CurrentUser.h"

@interface OpenBookingTableViewController ()

@end

@implementation OpenBookingTableViewController
@synthesize bookingList, success, booking;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CurrentUser *c = [CurrentUser sharedSingleton];
    PFObject* p = [Person getPersonByEmail:c.currentUser.person.email];
    bookingList = [Bookings getOpenBookins:p];
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Bookings* bb = [self.bookingList objectAtIndex:indexPath.row];
        [bb cancelBooking:bb.objectId];
        [bookingList removeObject:bb];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSString *msg = [NSString stringWithFormat:@"Selected Booking has been Canceled"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [bookingList count];
}


//// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"bookings";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cell_id];
    
    Bookings* b = [self.bookingList objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell_id];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = b.when;
    if([b.status isEqualToString:@"1"]){
        cell.detailTextLabel.text = @"Cab Booked";
    }
    else{
        cell.detailTextLabel.text = @"Cab Arriving";
        cell.detailTextLabel.textColor = [UIColor greenColor];
    }
    return cell;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CurrentUser *c = [CurrentUser sharedSingleton];
    PFObject* p = [Person getPersonByEmail:c.currentUser.person.email];
    bookingList = [Bookings getOpenBookins:p];
    [self.tableView reloadData];
}


@end
