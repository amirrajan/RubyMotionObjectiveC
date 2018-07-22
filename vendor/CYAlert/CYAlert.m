// CYAlert.m
#import "CYAlert.h"

@implementation CYAlert

+ (NSDictionary*) show: (NSDictionary*) args {
    NSLog(@"%@", [args objectForKey: @"name"]);
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"This is Objective-C";
    alert.message = @"Mixing and matching!";
    [alert addButtonWithTitle:@"OK"];
    [alert show];
    [alert release];
    return args;
}

@end
