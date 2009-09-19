#import "RyderAppDelegate.h"
#import "PFMoveApplication.h"

@implementation RyderAppDelegate

@synthesize window;

- (void) applicationWillFinishLaunching:(NSNotification*)notification
{
    [window center];
    
    PFMoveToApplicationsFolderIfNecessary();
}

@end
