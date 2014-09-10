

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomPlacemark : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) MKCoordinateRegion coordinateRegion;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

-(id)initWithRegion:(MKCoordinateRegion)coordRegion;
@end
