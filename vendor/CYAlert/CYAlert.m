// CYAlert.m
#import "CYAlert.h"
#import <simd/simd.h>

@implementation CYAlert

+ (void)show {
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"This is Objective-C";
    alert.message = @"Mixing and matching!";
    [alert addButtonWithTitle:@"OK"];
    [alert show];
    [alert release];
}

static const vector_float2 triangleVertices[] =
{
    {  1,  -1 },
    { -1,  -1 },
    {  0,   1 },
};


+ (void)yolo {
  vector_float2 first = triangleVertices[0];
  float firstFirst = first[0];
  NSLog(@"%f", firstFirst);
}

@end
