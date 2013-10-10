@class TheaterBoxWindowController;
@class TheaterBoxView;

@interface TheaterBox : NSObject

/***************************
 * Public Instance Getters *
 ***************************/

@property (readonly) TheaterBoxView *scene;

/***************************
 * Public Instance Setters *
 ***************************/

- (void) activate;
- (void) deactivate;
- (void) toggle;

@end

/********************************
 * Internal Instance Properties *
 ********************************/

@interface TheaterBox ()

@property (readwrite) BOOL activated;
@property (readonly) TheaterBoxWindowController *windowController;

@end
