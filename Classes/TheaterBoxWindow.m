#import "TheaterBoxWindow.h"

#import "TheaterBoxView.h"

@implementation TheaterBoxWindow

- (id) init {
  NSRect frame = NSMakeRect(0, 0, 300, 200);
  unsigned styleMask = NSTitledWindowMask | NSResizableWindowMask;
  if (self = [super initWithContentRect:frame styleMask:styleMask backing:NSBackingStoreBuffered defer:NO]) {
    self.boxView = [TheaterBoxView new];
    [self.contentView addSubview:self.boxView];
  }
  return self;
}

- (BOOL)canBecomeKeyWindow {
  return NO;
}

@end
