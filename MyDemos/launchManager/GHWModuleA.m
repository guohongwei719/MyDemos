//
//  GHWModuleA.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/13.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWModuleA.h"

@implementation GHWModuleA


RAM_FUNCTION_EXPORT(pre_main)() {
    printf("ModuleA:pre_main");
}

RAM_FUNCTION_EXPORT(stage_A)() {
    printf("ModuleA:stage_A");
}

RAM_FUNCTION_EXPORT(stage_B)() {
    printf("ModuleA:stage_B");
}


@end
