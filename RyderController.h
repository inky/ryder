//  Ryder.app
//
//  (c) 2008-2009 Liam Cooke
//  MIT Licensed -- see LICENSE.txt

#import <Cocoa/Cocoa.h>
#import "RyderNamer.h"
#import "RyderNameView.h"

@interface RyderController : NSObject
{
    NSWindow *window;
    
	IBOutlet RyderNameView *nameView;
	IBOutlet NSButton *nameButton;
	
	RyderNamer *ryder;
	
	BOOL speechEnabled;
	NSSpeechSynthesizer *speechSynth;
	NSArray *voices;
}

@property (assign) IBOutlet NSWindow *window;

-(id)init;

-(IBAction)newName:(id)sender;
-(IBAction)enableSpeech:(NSButton*)sender;

// In Interface Builder, make a 'delegate' connection
// from File's Owner to Ryder Controller.

@end
