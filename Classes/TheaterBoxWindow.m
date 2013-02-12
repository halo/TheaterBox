#import "TheaterBoxWindow.h"

#import "TheaterBoxView.h"
#import "TheaterBoxScreen.h"

@implementation TheaterBoxWindow

- (id) init {
  NSRect frame = NSMakeRect(0, 0, 300, 200);
  unsigned styleMask = NSTitledWindowMask | NSResizableWindowMask;
  if (self = [super initWithContentRect:frame styleMask:styleMask backing:NSBackingStoreBuffered defer:NO]) {
    [self.contentView addSubview:[TheaterBoxView new]];
    NSScreen *screen = [TheaterBoxScreen suggestedScreenForProjector];
    float x = screen.frame.size.width - self.frame.size.width - (self.frame.size.width / 4);
    float y = self.frame.size.height;
    [self cascadeTopLeftFromPoint:NSMakePoint(x, y)];
  }
  return self;
}

- (BOOL)canBecomeKeyWindow {
  return NO;
}

@end
