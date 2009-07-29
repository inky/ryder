#import "RyderNameView.h"

@implementation RyderNameView

@synthesize name, font, parStyle, fontAttribs;

- (id)initWithFrame:(NSRect)frame
{
	if (self = [super initWithFrame:frame]) {
		name = @"Blast Hardcheese";
				
		font = [NSFont fontWithName:@"HelveticaNeue-CondensedBlack" size:28];
		parStyle = [[NSMutableParagraphStyle alloc] init];
		[parStyle setAlignment:NSCenterTextAlignment];
		
		fontAttribs = [NSMutableDictionary new];
		[fontAttribs setObject:font forKey:NSFontAttributeName];
		[fontAttribs setObject:parStyle forKey:NSParagraphStyleAttributeName];
		[fontAttribs setValue:[NSNumber numberWithFloat:-0.5] forKey:NSKernAttributeName];
        
		// TODO: center text vertically
	}
	return self;
}

- (void)drawRect:(NSRect)rect
{
	NSString *displayName = [[name uppercaseString]
		stringByReplacingOccurrencesOfString:@"." withString:@""];
	[displayName drawInRect:rect withAttributes:fontAttribs];
}

@end