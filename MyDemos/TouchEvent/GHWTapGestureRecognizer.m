//
//  GHWTapGestureRecognizer.m
//  MyDemos
//
//  Created by 黑化肥发灰 on 2019/8/15.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWTapGestureRecognizer.h"

@implementation GHWTapGestureRecognizer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@_touchesBegan", self.name);
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@_touchesMoved", self.name);
    [super touchesMoved:touches withEvent:event];
}

// NSLog 要写在 super 后面来读取 state
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    NSLog(@"%@_touchesEndedWithState: %d", self.name, (int)self.state);
}

// NSLog 要写在 super 后面来读取 state
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"%@_touchesCancelledWithState: %d", self.name, (int)self.state);
}


@end
