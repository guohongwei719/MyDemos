//
//  GHWEventDView.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/15.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWEventDView.h"

#import "GHWTapGestureRecognizer.h"
#import "GHWEventButton.h"

@interface GHWEventDView () <UIGestureRecognizerDelegate>


@end

@implementation GHWEventDView

- (instancetype)init {
    self = [super init];
    if (self) {
        GHWTapGestureRecognizer *tapGest = [[GHWTapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGesture)];
        tapGest.name = @"DViewTapGestureRecognizer";
        tapGest.delegate = self;
        [self addGestureRecognizer:tapGest];
//
        GHWEventButton *button = [[GHWEventButton alloc] initWithFrame:CGRectMake(80, 10, 50, 40)];
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

//- (void)buttonTapped {
//    NSLog(@"D_buttonTapped");
//}
//
//- (void)singleTapGesture {
//    NSLog(@"D_singleTapGesture");
//}
//
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    NSLog(@"D_view--- gestureRecognizerShouldBegin: %@ ---", gestureRecognizer.name);
//    return YES;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    NSLog(@"D_view--- gestureRecognizer shouldReceiveTouch: %@ ---", gestureRecognizer.name);
//    return YES;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    NSLog(@"D_view--- gestureRecognizer: %@ otherGestureRecognizer: %@ ---", gestureRecognizer.name, otherGestureRecognizer.name);
//    return NO;
//}
//
//
//
//
//
//
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"进入D_View---hitTest withEvent ---");
//    UIView * view = [super hitTest:point withEvent:event];
//    NSLog(@"离开D_View--- hitTest withEvent ---hitTestView:%@",view);
//    return view;
//}
//
//- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
//    NSLog(@"D_view--- pointInside withEvent ---");
//    BOOL isInside = [super pointInside:point withEvent:event];
//    NSLog(@"D_view--- pointInside withEvent --- isInside:%d",isInside);
//    return isInside;
//}
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"D_touchesBegan");
//    [super touchesBegan:touches withEvent:event];
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"D_touchesMoved");
//    [super touchesMoved:touches withEvent:event];
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"D_touchesEnded");
//    [super touchesEnded:touches withEvent:event];
//}
//
//-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"D_touchesCancelled");
//    [super touchesCancelled:touches withEvent:event];
//}

@end
