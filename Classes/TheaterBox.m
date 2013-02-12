#import "TheaterBox.h"

#import "TheaterBoxWindowController.h"
#import "TheaterBoxView.h"
#import "TheaterBoxScreen.h"
#import "TheaterBoxWindow.h"

@implementation TheaterBox

@synthesize activated, scene;

- (id) init {
  if (self = [super init]) {
    self.activated = NO;
    self.windowController = [TheaterBoxWindowController new];
  }
  return self;
}

- (TheaterBoxView*) scene {
  return self.windowController.scene ;
}

- (void) activate {
  if ([TheaterBoxScreen singleScreenMode]) {
    // Ensure there is nothing stuck in fullscreen mode
    [self.scene exitFullscreen];
    // Show the single-screen mode window
    NSLog(@"opening window...");
    [self.windowController showWindow:self];
  } else {
    // Ensure the single-screen mode window is gone
    NSLog(@"closing window controller...");
    [self.windowController close];
    // Go fullscreen on secondary screen
    [self.scene goFullscreen];
  }
  self.activated = YES;
}

- (void) deactivate {
  // Shut down all projector windows and views
  // These methods won't fail if they are already closed
  [self.windowController close];
  [self.scene exitFullscreen];
  self.activated = NO;
}

- (void) toggle {
  self.activated ? [self deactivate] : [self activate];
}

@end
