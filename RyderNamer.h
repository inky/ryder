#import <Cocoa/Cocoa.h>

@interface RyderNamer : NSObject
{
	NSArray *firstNames;
	NSArray *lastNames;
	int totalFirstNames;
	int totalLastNames;
}

@property(readonly) NSArray *firstNames, *lastNames;
@property(readonly) int totalFirstNames, totalLastNames;

+(NSArray*)namesFromString:(NSString*)nameString;

-(id)init;
-(NSArray*)name;

@end
