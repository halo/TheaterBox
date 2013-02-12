#import "TheaterBoxWindowController.h"

#import "TheaterBoxWindow.h"

@implementation TheaterBoxWindowController

- (id) init {
  if (self = [super initWithWindow:[TheaterBoxWindow new]]) {
    [self setupWindow];
  }
  return self;
}

- (void) setupWindow {
  self.window.movableByWindowBackground = YES;
  self.window.backgroundColor =[NSColor blackColor];
  self.window.title = NSLocalizedString(@"", nil);
}

- (TheaterBoxView*) scene {
  return [[self.window.contentView subviews] objectAtIndex:0];
}

@end