//  Ryder.app
//
//  (c) 2008-2009 Liam Cooke
//  MIT Licensed -- see LICENSE.txt

#import <Cocoa/Cocoa.h>

@interface RyderNameView : NSView
{
	NSString *name;
	NSFont *font;
	NSMutableParagraphStyle *parStyle;
	NSMutableDictionary *fontAttribs;
    NSMutableDictionary *shadowAttribs;
}

@property(copy) NSString *name;
@property(readonly) NSFont *font;
@property(readonly) NSMutableParagraphStyle *parStyle;
@property(readonly) NSMutableDictionary *fontAttribs;

@end
