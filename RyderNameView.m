//  Ryder.app
//
//  (c) 2008-2009 Liam Cooke
//  MIT Licensed -- see LICENSE.txt

#import "RyderNameView.h"

@implementation RyderNameView

@synthesize name, font, parStyle, fontAttribs;

- (id)initWithFrame:(NSRect)frame
{
	if (self = [super initWithFrame:frame]) {
		name = @"Blast Hardcheese";
				
		font = [NSFont fontWithName:@"HelveticaNeue-CondensedBlack" size:32];
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
    
    NSSize stringSize = [displayName
        boundingRectWithSize:rect.size
                     options:(NSStringDrawingUsesLineFragmentOrigin |
                              NSStringDrawingDisableScreenFontSubstitution)
                  attributes:fontAttribs].size;
    
    NSRect drawRect = rect;
    drawRect.size.height = stringSize.height;
    drawRect.origin.y = rect.origin.y + (rect.size.height - stringSize.height)/2;
    
	[displayName drawInRect:drawRect withAttributes:fontAttribs];
}

@end
