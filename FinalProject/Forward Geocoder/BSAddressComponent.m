

#import "BSAddressComponent.h"


@implementation BSAddressComponent
@synthesize shortName = _shortName;
@synthesize longName = _longName;
@synthesize types = _types;


- (id)initWithCoder:(NSCoder*)decoder {
    if (self = [super init]) {
        self.shortName = [decoder decodeObjectForKey:@"shortName"];
        self.longName = [decoder decodeObjectForKey:@"longName"];
        self.types = [decoder decodeObjectForKey:@"types"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder {
    
    if (self.shortName) {
        [encoder encodeObject:self.shortName
                       forKey:@"shortName"];
    }
    if (self.longName) {
        [encoder encodeObject:self.longName
                       forKey:@"longName"];
    }
    if (self.types) {
        [encoder encodeObject:self.types
                       forKey:@"types"];
    }
}

- (void)dealloc
{
	[_shortName release];
	[_longName release];
	[_types release];
	[super dealloc];
}
@end
