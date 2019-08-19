//
//  GHWModuleA.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/13.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWModuleA.h"

@implementation GHWModuleA

GHW_FUNCTION_EXPORT(pre_main)() {
    printf("ModuleA:pre_main");
}

GHW_FUNCTION_EXPORT(stage_A)() {
    printf("ModuleA:stage_A");
}

GHW_FUNCTION_EXPORT(stage_B)() {
    printf("ModuleA:stage_B");
}

@end
