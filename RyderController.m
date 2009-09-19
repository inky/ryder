//  Ryder.app
//
//  (c) 2008-2009 Liam Cooke
//  MIT Licensed -- see LICENSE.txt

#import <QuartzCore/QuartzCore.h>
#import "RyderController.h"
#import "RyderNamer.h"

//static NSString *speakNames = @"speakNames";

@implementation RyderController

@synthesize window;

-(id)init
{
    self = [super init];
	if (self) {
		ryder = [[RyderNamer alloc] init];
		
		speechEnabled = NO;  //[[NSUserDefaults standardUserDefaults] boolForKey:speakNames];
		speechSynth = [NSSpeechSynthesizer new];
		voices = [NSArray arrayWithObjects:
			@"com.apple.speech.synthesis.voice.Alex",
			@"com.apple.speech.synthesis.voice.Alex",
			@"com.apple.speech.synthesis.voice.Bruce",
			nil];
	}
	return self;
}

-(IBAction)newName:(id)sender
{
	NSMutableArray *nameParts = [[ryder name] mutableCopy];
	
	nameView.name = [nameParts componentsJoinedByString:@""];
	[nameView display];
	
	if (speechEnabled) {
		if ([speechSynth isSpeaking])
			[speechSynth stopSpeaking];
			
		if ([[nameParts objectAtIndex:1] isEqualToString:@" Mc"])
			[nameParts replaceObjectAtIndex:1 withObject:@" [[inpt PHON]] ~mAXk [[inpt TEXT]] [[emph +]] "];
		else
			[nameParts replaceObjectAtIndex:1 withObject:@" [[slnc 40]] [[emph +]] "];
		
		NSString *last = [[[nameParts objectAtIndex:2]
			stringByReplacingOccurrencesOfString:@"-" withString:@""]
			stringByReplacingOccurrencesOfString:@"." withString:@" [[emph -]] "];
		[nameParts replaceObjectAtIndex:2 withObject:last];
		
		NSString *speakName = [nameParts componentsJoinedByString:@""];
		speakName = [speakName stringByReplacingOccurrencesOfString:@"-" withString:@" "];
		speakName = [speakName stringByAppendingString:(random()%3==0 ? @"!" : @".")];
		
		//NSLog(@"Speaking: %@", speakName);
		[speechSynth setVoice:[voices objectAtIndex:random() % [voices count]]];
		[speechSynth startSpeakingString:speakName];
	}
}

-(IBAction)enableSpeech:(NSButton*)sender
{
	speechEnabled = [sender state] ? YES : NO;
	//[[NSUserDefaults standardUserDefaults] setBool:speechEnabled forKey:speakNames];
}

-(void)awakeFromNib
{
    [window setDelegate:self];
    [window center];
}

-(void)applicationWillFinishLaunching:(NSNotification*)notification
{
    PFMoveToApplicationsFolderIfNecessary();
    
    [window setAlphaValue:0.0];
    [window makeKeyAndOrderFront:self];
    [window.animator setAlphaValue:1.0];
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)theApplication
{
	return YES;
}

-(BOOL)windowShouldClose:(id)theWindow
{
    //[window.animator setAlphaValue:0.0];
    return YES;
}

@end
