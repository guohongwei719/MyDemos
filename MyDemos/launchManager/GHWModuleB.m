//
//  GHWModuleB.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/13.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWModuleB.h"

@implementation GHWModuleB

GHW_FUNCTION_EXPORT(Stage_A)() {
    printf("ModuleB:Stage_A");
}

GHW_FUNCTION_EXPORT(Stage_B)() {
    printf("ModuleB:Stage_B");
}

@end
