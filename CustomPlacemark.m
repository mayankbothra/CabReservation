
#import "CustomPlacemark.h"


@implementation CustomPlacemark
@synthesize coordinate = _coordinate;
@synthesize coordinateRegion = _coordinateRegion;
@synthesize title = _title;
@synthesize subtitle = _subtitle;

- (id)initWithRegion:(MKCoordinateRegion)coordRegion 
{
	if ((self = [super init])) {
		_coordinate = coordRegion.center;
		_coordinateRegion = coordRegion;        
    }
	
	return self;
}

- (void)dealloc 
{
    [_title release];
    [_subtitle release];
	[super dealloc];
}
@end
