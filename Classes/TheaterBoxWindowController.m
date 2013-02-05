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
  //self.window.contentSize = [[NSApp projectorController] recommendedThumbnailSize];
  self.window.backgroundColor =[NSColor blackColor];
  self.window.title = NSLocalizedString(@"projector.window.title", nil);
}

@end