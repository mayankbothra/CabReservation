//
//  FromViewController.h
//  FinalProject
//
//  Created by Mayank Bothra on 12/13/13.
//  Copyright (c) 2013 Mayank Bothra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BSForwardGeocoder.h"
#import "BSKmlResult.h"


@interface FromViewController : UIViewController<BSForwardGeocoderDelegate>
@property (retain, nonatomic) IBOutlet MKMapView *fromMap;
@property (retain, nonatomic) IBOutlet UISearchBar *searchFrom;
@property (nonatomic, retain) BSForwardGeocoder *forwardGeocoder;
- (IBAction)saveButton:(id)sender;

@end
