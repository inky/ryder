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
				
		font = [NSFont fontWithName:@"Futura-CondensedMedium" size:40];
		parStyle = [[NSMutableParagraphStyle alloc] init];
		[parStyle setAlignment:NSCenterTextAlignment];
		
		fontAttribs = [NSMutableDictionary new];
		[fontAttribs setObject:font forKey:NSFontAttributeName];
		[fontAttribs setObject:parStyle forKey:NSParagraphStyleAttributeName];
        [fontAttribs setValue:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
		[fontAttribs setValue:[NSNumber numberWithFloat:-0.5] forKey:NSKernAttributeName];
        
        shadowAttribs = [NSMutableDictionary dictionaryWithDictionary:fontAttribs];
        [shadowAttribs setValue:[NSColor colorWithCalibratedWhite:0.9 alpha:0.5]
                         forKey:NSForegroundColorAttributeName];
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
    
#ifdef DEBUG
    [[NSColor colorWithCalibratedWhite:0.2 alpha:0.2] set];
    [NSBezierPath strokeRect:rect];
    [NSBezierPath strokeRect:drawRect];
#endif
    
	[displayName drawInRect:drawRect withAttributes:shadowAttribs];
    drawRect.origin.y += 1;
	[displayName drawInRect:drawRect withAttributes:fontAttribs];
}

@end
