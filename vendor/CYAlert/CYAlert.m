#import "CYAlert.h"

@implementation CYAlert

#define SAY_HELLO_MESSAGE @"HI"

+ (void)show {
  NSLog(SAY_HELLO_MESSAGE);
}

+ (void)yolo {
  UIView *superview = [[UIView alloc] init];
  UIView *view1 = [[UIView alloc] init];

  UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);

  [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.edges.equalTo(superview).with.insets(padding);
    }];
}

@end
