//
//  GHWModuleB.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/13.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWModuleB.h"

@implementation GHWModuleB

GHW_FUNCTION_EXPORT(stage_a)() {
    printf("ModuleB:stage_a\n");
}

GHW_FUNCTION_EXPORT(stage_b)() {
    printf("ModuleB:stage_b\n");
}

@end
