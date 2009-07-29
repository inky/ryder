#import "RyderNamer.h"

@implementation RyderNamer

@synthesize firstNames, lastNames, totalFirstNames, totalLastNames;

+(NSArray*)namesFromString:(NSString*)nameString
{
	return [nameString componentsSeparatedByString:@", "];
}

-(id)init
{
	if (self = [super init]) {
		firstNames = [RyderNamer namesFromString:NSLocalizedString(@"First Names", @"")];
		lastNames = [RyderNamer namesFromString:NSLocalizedString(@"Last Names", @"")];
		
		totalFirstNames = [firstNames count];
		totalLastNames = [lastNames count];
		
		srandom(time(NULL));
	}
	return self;
}

-(NSArray*)name
{
	if (random() % 999 == 666)
		return [NSArray arrayWithObjects:@"Bob", @" ", @"Johnson", nil];

	NSString *firstName = [firstNames objectAtIndex:(random() % totalFirstNames)];
	NSString *lastName = [lastNames objectAtIndex:(random() % totalLastNames)];
	NSString *sep = (random() % 5 == 4) ? @" Mc" : @" ";
	
	return [NSArray arrayWithObjects:firstName, sep, lastName, nil];
}

@end
