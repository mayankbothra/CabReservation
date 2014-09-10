
#import <Foundation/Foundation.h>

@interface BSAddressComponent : NSObject<NSCoding>

@property (nonatomic, retain) NSString *longName;
@property (nonatomic, retain) NSString *shortName;
@property (nonatomic, retain) NSArray *types;

@end
