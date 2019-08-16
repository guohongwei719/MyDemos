//
//  GHWAttributeTestObject.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/14.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWAttributeTestObject.h"

@implementation GHWAttributeTestObject

- (void)testWithSex:(NSString *)sex address:(NSString *)address age:(NSInteger)age __attribute__((nonnull(1,2))) {
    return;
}

- (void)work {
    [super work];
    NSLog(@"GHWAttributeTestObject: work");
}

@end
