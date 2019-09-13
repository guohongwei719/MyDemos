//
//  GHWModuleC.m
//  MyDemos
//
//  Created by 黑化肥发灰 on 2019/8/13.
//  Copyright © 2019 黑化肥发灰. All rights reserved.
//

#import "GHWModuleC.h"
#import <GHWPodDemo/GHWExport.h>
@implementation GHWModuleC

GHW_FUNCTION_EXPORT(pre_main)() {
    printf("ModuleC:pre_main\n");
    [[GHWModuleC sharedInstance] initMudule];
}

//GHW_FUNCTION_EXPORT(Stage_A)() {
//    printf("ModuleC:Stage_A\n");
//}

static void _GHWStage_A(void); \
__attribute__((used, section("__GHW,__Stage_A"))) \
static const struct GHW_Function __FStage_A = (struct GHW_Function){(char *)(&("Stage_A")), (void *)(&_GHWStage_A)}; \
static void _GHWStage_A () {
    printf("ModuleC:Stage_A\n");
}

GHW_FUNCTION_EXPORT(Stage_B)() {
    printf("ModuleC:Stage_B\n");
}

+ (instancetype)sharedInstance {
    static GHWModuleC *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GHWModuleC alloc] init];
    });
    return instance;
}

- (void)initMudule {
    NSLog(@"GHWModuleC start init ...");
}

@end
