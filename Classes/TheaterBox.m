#import "TheaterBox.h"

#import "TheaterBoxWindowController.h"
#import "TheaterBoxView.h"
#import "TheaterBoxScreen.h"
#import "TheaterBoxWindow.h"

@implementation TheaterBox

/***************************
 * Public Instance Getters *
 ***************************/

/* Returns the NSView you can draw on.
 * It represents the most bottom layer of your layer hierarchy.
 */
- (TheaterBoxView*) scene {
  return self.windowController.scene ;
}

/***************************
 * Public Instance Setters *
 ***************************/

/* Shows the TheaterBox in the most optimal way for presentation.
 */
- (void) activate {
  if ([TheaterBoxScreen singleScreenMode]) {
    // Ensure there is nothing stuck in fullscreen mode.
    [self.scene exitFullscreen];
    // Show the single-screen mode window.
    [self.windowController showWindow:self];
  } else {
    // Ensure the single-screen mode window is gone.
    [self.windowController close];
    // Go fullscreen on secondary screen.
    [self.scene goFullscreen];
  }
  self.activated = YES;
}

- (void) deactivate {
  // Shut down all projector windows and views.
  // These methods won't fail if they are already closed.
  [self.windowController close];
  [self.scene exitFullscreen];
  self.activated = NO;
}

- (void) toggle {
  self.activated ? [self deactivate] : [self activate];
}

/*****************************
 * Internal Instance Getters *
 *****************************/

@synthesize activated;

// Lazy-loading the controller.
@synthesize windowController;
- (TheaterBoxWindowController*) windowController {
  if (windowController) return windowController;
  windowController = [TheaterBoxWindowController new];
  return windowController;
}

@end
