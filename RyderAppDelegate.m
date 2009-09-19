//  Ryder.app
//
//  (c) 2008-2009 Liam Cooke
//  MIT Licensed -- see LICENSE.txt

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
