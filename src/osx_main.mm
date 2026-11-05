#import <stdio.h>

int main(int argc, const char **argv) {
  while(true) {
    NSEvent* event;
    do {
      event = [NSApp nextEventMatchingMask: NSEventMaskAny
        untilDate: nil
        inMode: NSDefaultRunLoopMode
        dequeue: Yes];
        ];
      switch ([event type]) {
        default:
          [NSApp sendEvent: event];
      }
    } while (event != nil);
  }
}
