#import <Cocoa/Cocoa.h>
#import "RyderNamer.h"
#import "RyderNameView.h"

@interface RyderController : NSObject
{
	IBOutlet RyderNameView *nameView;
	IBOutlet NSButton *nameButton;
	
	RyderNamer *ryder;
	
	BOOL speechEnabled;
	NSSpeechSynthesizer *speechSynth;
	NSArray *voices;
}

-(id)init;

-(IBAction)newName:(id)sender;
-(IBAction)enableSpeech:(NSButton*)sender;

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)theApplication;

// In Interface Builder, make a 'delegate' connection
// from File's Owner to Ryder Controller.

@end
