//  Ryder.app
//
//  (c) 2008-2009 Liam Cooke
//  MIT Licensed -- see LICENSE.txt

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
