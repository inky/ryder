#import <Cocoa/Cocoa.h>
#import "RyderNamer.h"

int main(int argc, char *argv[])
{
	// configure defaults
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSDictionary *appDefaults = [NSDictionary dictionaryWithObject:@"NO" forKey:@"SpeakNames"];
	[defaults registerDefaults:appDefaults];
		
	return NSApplicationMain(argc,  (const char **) argv);
}
