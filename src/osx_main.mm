#include <AppKit/AppKit.h>
#include <stdio.h>

static float GlobalRenderingWidth = 1024;
static float GlobalRenderingHeight = 768;

static bool Running = true;

@interface HandmadeWindowDelegate : NSObject <NSWindowDelegate>
@end

@implementation HandmadeWindowDelegate
- (void)windowWillClose:(NSNotification *)notification {
  Running = false;
}
@end

int main(int argc, const char **argv) {
  NSRect screenRect = [[NSScreen mainScreen] frame];

  NSRect windowRect =
      NSMakeRect((screenRect.size.width - GlobalRenderingWidth) * 0.5,
                 (screenRect.size.height - GlobalRenderingHeight) * 0.5,
                 GlobalRenderingWidth, GlobalRenderingHeight);

  NSWindow *window = [[NSWindow alloc]
      initWithContentRect:windowRect
                styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
                          NSWindowStyleMaskMiniaturizable |
                          NSWindowStyleMaskResizable
                  backing:NSBackingStoreBuffered
                    defer:false];

  [window setBackgroundColor:NSColor.blackColor];
  [window setTitle:@"Handmade Hero"];
  [window makeKeyAndOrderFront:nil];
  HandmadeWindowDelegate *windowDelegate =
      [[HandmadeWindowDelegate alloc] init];
  [window setDelegate:windowDelegate];

  while (Running) {
    NSEvent *event;
    do {
      event = [NSApp nextEventMatchingMask:NSEventMaskAny
                                 untilDate:nil
                                    inMode:NSDefaultRunLoopMode
                                   dequeue:true];
      switch ([event type]) {
      default:
        [NSApp sendEvent:event];
      }
    } while (event != nil);
  }
  printf("Game has closed");
}
