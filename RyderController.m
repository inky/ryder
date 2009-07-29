#import "RyderController.h"
#import "RyderNamer.h"

@implementation RyderController

-(id)init
{
	if (self = [super init]) {
		ryder = [[RyderNamer alloc] init];
		
		speechEnabled = NO;  //[[NSUserDefaults standardUserDefaults] boolForKey:@"SpeakNames"];
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
	[[NSUserDefaults standardUserDefaults]
		setObject:(speechEnabled ? @"YES" : @"NO")
		forKey:@"SpeakNames"];
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)theApplication
{
	return YES;
}

@end
