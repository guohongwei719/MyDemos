//
//  GHWEventButton.m
//  MyDemos
//
//  Created by 黑化肥发灰 on 2019/8/16.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWEventButton.h"
#import "GHWTapGestureRecognizer.h"

@interface GHWEventButton () <UIGestureRecognizerDelegate>

@end

@implementation GHWEventButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        GHWTapGestureRecognizer *tapGestureRecognizer = [[GHWTapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGesture)];
        tapGestureRecognizer.name = @"F_Button_tapGestureRecognizer";
        tapGestureRecognizer.delegate = self;
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    
    return self;
}

- (void)singleTapGesture {
    NSLog(@"F_singleTapGesture");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([super gestureRecognizerShouldBegin:gestureRecognizer]) {
        NSLog(@"F_Button--- gestureRecognizerShouldBegin: %@ YES ---", gestureRecognizer.name);
    } else {
        NSLog(@"F_Button--- gestureRecognizerShouldBegin: %@ NO ---", gestureRecognizer.name);
    }
    return [super gestureRecognizerShouldBegin:gestureRecognizer];
}



@end
