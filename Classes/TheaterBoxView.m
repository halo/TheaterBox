#import "TheaterBoxView.h"

#import "TheaterBoxScreen.h"

@implementation TheaterBoxView

- (id) init {
  NSRect frame = NSMakeRect(0, 0, 1, 1);
  self = [super initWithFrame:frame];
  return self;
}

- (void) drawRect:(NSRect)rect {
  [[NSColor blackColor] set];
  [NSBezierPath fillRect: [self bounds]];
}

- (void) mouseDown:(NSEvent*)event {
  [super mouseDown:event];
  if ([event clickCount] == 2) [self wasDoubleClicked];
}

- (void) wasDoubleClicked {
  [self toggleFullscreen];
}

- (void) toggleFullscreen {
  if ([self isInFullScreenMode]) {
    [self exitFullscreen];
  } else {
    [self goFullscreen];
  }
}

- (void) goFullscreen {
  NSDictionary *opts = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], NSFullScreenModeAllScreens, NULL, NSFullScreenModeApplicationPresentationOptions, NULL];
  [self enterFullScreenMode:[TheaterBoxScreen suggestedScreenForProjector] withOptions:opts];
}

- (void) exitFullscreen {
  [self exitFullScreenModeWithOptions:NULL];
}

- (void) viewWillDraw {
  [self expand];
}

- (void) expand {
  float superwidth = self.superview.frame.size.width;
  float superheight = self.superview.frame.size.height;
  if (superwidth / superheight > 1.7778) {
    float width = superheight * 1.7778;
    float x = (superwidth - width) / 2;
    self.frame = NSMakeRect(x, 0, width, superheight);
  } else {
    float height = superwidth * 0.5625;
    float y = (superheight - height) / 2;
    self.frame = NSMakeRect(0, y, superwidth, height);
  }
}

@end
