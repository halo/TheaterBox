#import "TheaterBox.h"

#import "TheaterBoxWindowController.h"
#import "TheaterBoxView.h"
#import "TheaterBoxScreen.h"
#import "TheaterBoxWindow.h"

@implementation TheaterBox

@synthesize activated, scene;


- (id) init {
  if (self = [super init]) {
    [self initStatusTrackers];
    //[self initView];
    [self initWindowController];
  }
  return self;
}


- (void) initStatusTrackers {
  self.activated = NO;

}

- (void) initWindowController {
  //NSWindow *window = [[TheaterBoxWindow alloc] initWithContentRect:NSMakeRect(0, 0, 200, 200) styleMask:NSTitledWindowMask backing:NSBackingStoreBuffered defer:NO];
  self.windowController = [TheaterBoxWindowController new];
  //window.delegate = self.windowController;
  NSLog(@"I have a window: %@", self.windowController.window);
  //[self.windowController.window makeKeyAndOrderFront:self];
  NSLog(@"I have a window: %f", self.windowController.window.frame.origin.x);
  //[self.windowController.window isVisible];
  //[self.windowController.window makeKeyAndOrderFront:<#(id)#>];
}

- (void) initView {
  //self.view = [TheaterBoxView new];
  //[self.projectorView setAutoresizingMask:(NSViewMinXMargin|NSViewWidthSizable|NSViewMaxXMargin|NSViewMinYMargin|NSViewHeightSizable|NSViewMaxYMargin)];
  //[self.projectorView setFrame:NSMakeRect(0, 0, self.projectorView.superview.frame.size.width, self.projectorView.superview.frame.size.height)];
}

- (TheaterBoxView*) scene {
  return [[self.windowController.window.contentView subviews] objectAtIndex:0];
}

- (void) activate {
  if ([TheaterBoxScreen singleScreenMode]) {
    // Ensure there is nothing stuck in fullscreen mode
    //[self.projectorView exitFullscreen];
    // Show the single-screen mode window
    NSLog(@"opening window...");
    [self.windowController showWindow:self];
    //[[self.windowController window] setContentView:self.view];
  } else {
    // Ensure the single-screen mode window is gone
    NSLog(@"closing window controller...");
    [self.windowController close];
    // Go fullscreen on secondary screen
    //[self.projectorView goFullscreen];
  }
  //[self maximizeProjectorSubview];
  self.activated = YES;
}

- (void) deactivate {
  
}

@end
