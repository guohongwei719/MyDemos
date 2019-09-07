//
//  GHWEventCView.m
//  MyDemos
//
//  Created by 黑化肥发灰 on 2019/8/15.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWEventCView.h"
#import "GHWTapGestureRecognizer.h"

@interface GHWEventCView () <UIGestureRecognizerDelegate>


@end

@implementation GHWEventCView

- (instancetype)init {
    self = [super init];
    if (self) {
        GHWTapGestureRecognizer *tapGest = [[GHWTapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGesture)];
        tapGest.name = @"CViewTapGestureRecognizer";
        tapGest.delegate = self;
        [self addGestureRecognizer:tapGest];
    }
    return self;
}


//- (void)singleTapGesture {
//    NSLog(@"C_singleTapGesture");
//}
//
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    NSLog(@"C_view--- gestureRecognizerShouldBegin: %@ ---", gestureRecognizer.name);
//    return YES;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    NSLog(@"C_view--- gestureRecognizer shouldReceiveTouch: %@ ---", gestureRecognizer.name);
//    return YES;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    NSLog(@"C_view--- gestureRecognizer: %@ otherGestureRecognizer: %@ ---", gestureRecognizer.name, otherGestureRecognizer.name);
//    return YES;
//}




//
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"进入C_View---hitTest withEvent ---");
//    UIView * view = [super hitTest:point withEvent:event];
//    NSLog(@"离开C_View--- hitTest withEvent ---hitTestView:%@",view);
//    return view;
//}
//
//- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
//    NSLog(@"C_view--- pointInside withEvent ---");
//    BOOL isInside = [super pointInside:point withEvent:event];
//    NSLog(@"C_view--- pointInside withEvent --- isInside:%d",isInside);
//    return isInside;
//}
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"C_touchesBegan");
//    [super touchesBegan:touches withEvent:event];
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"C_touchesMoved");
//    [super touchesMoved:touches withEvent:event];
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    NSLog(@"C_touchesEnded");
//    [super touchesEnded:touches withEvent:event];
//}
//
//-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"C_touchesCancelled");
//    [super touchesCancelled:touches withEvent:event];
//}
@end
