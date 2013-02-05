@class TheaterBoxWindowController;
@class TheaterBoxView;

@interface TheaterBox : NSObject

@property (strong) TheaterBoxWindowController *windowController;
@property (nonatomic, readonly, strong) TheaterBoxView *scene;
@property (readwrite) BOOL activated;

- (void) activate;
- (void) deactivate;

@end
