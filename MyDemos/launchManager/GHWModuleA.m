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
    printf("ModuleA:pre_main\n");
}

//GHW_FUNCTION_EXPORT(Stage_A)() {
//    printf("ModuleA:Stage_A");
//}

static void _GHWStage_A(void); \
__attribute__((used, section("__GHW,__stage_a"))) \
static const struct GHW_Function __FStage_A = (struct GHW_Function){(char *)(&("stage_a")), (void *)(&_GHWStage_A)}; \
static void _GHWStage_A () {
    printf("ModuleA:Stage_A\n");
}

GHW_FUNCTION_EXPORT(stage_b)() {
    printf("ModuleA:stage_b\n");
}

@end
