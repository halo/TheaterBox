#import "TheaterBoxScreen.h"

@implementation TheaterBoxScreen

/********************
 * SCREEN DETECTION *
 ********************/

+ (BOOL) singleScreenMode {
  return ([[NSScreen screens] count] == 1);
}

+ (NSScreen*) suggestedScreenForProjector {
  if ([self singleScreenMode]) {
    // Single screen: Projector in a window mode
    return [NSScreen mainScreen];
  } else {
    // Multiple screens: Projector on secondary screen mode
    return [[NSScreen screens] lastObject];
  }
}

@end