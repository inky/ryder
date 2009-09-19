//  Ryder.app
//
//  (c) 2008-2009 Liam Cooke
//  MIT Licensed -- see LICENSE.txt

#import "RyderWindowView.h"

@implementation RyderWindowView

- (id)initWithFrame:(NSRect)frame
{
	self = [super initWithFrame:frame];
	return self;
}

- (void)drawRect:(NSRect)rect
{
	NSImage *image = [NSImage imageNamed:@"ryder"];
	NSPoint imagePoint = NSMakePoint(0, 0);  // bottom-left
	[image drawAtPoint:imagePoint fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
}

@end