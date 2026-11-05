#include <AppKit/AppKit.h>
#include <stdio.h>

int main(int argc, const char **argv) {
  while (true) {
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
  printf("Handmade hero finished running!");
}
