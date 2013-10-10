#import "TheaterBoxScreen.h"

@implementation TheaterBoxScreen

/************************
 * Public Class Getters *
 ************************/

/* Detects whether there is only one screen available or not.
 */
+ (BOOL) singleScreenMode {
  return ([[NSScreen screens] count] == 1);
}

/* Suggests a screen for presentation.
 */
+ (NSScreen*) suggestedScreenForProjector {
  if ([self singleScreenMode]) {
    // Single screen: Projector in a window mode.
    return [NSScreen mainScreen];
  } else {
    // Multiple screens: Projector on secondary screen mode.
    return [[NSScreen screens] lastObject];
  }
}

@end