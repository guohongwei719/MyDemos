//
//  GHWAttributeViewController.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/14.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWAttributeViewController.h"
#import "GHWAttributeTestObject.h"
//#import "RAMExport.h"

@interface GHWAttributeViewController ()


@end

@implementation GHWAttributeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    GHWAttributeTestObject *testObj = [[GHWAttributeTestObject alloc] init];
//    [testObj testMethod1];
//    [testObj testMethod2];
    [testObj testWithSex:@"1" address:@"2" age:4];
//    [testObj testMethod4];
//    [testObj testMethod5];
    [testObj work];
    NSString *testCleanUp __attribute__((cleanup(printTestString))) = @"测试一下";
    testCleanUp = @"1";
    
    NSLog(@"testObj class: %@",NSStringFromClass([testObj class]));
    
}

void printTestString(NSString **string){
    NSLog(@" 打印信息string:%@",*string);
}

__attribute__((constructor))
void premain() {
    [[GHWExport sharedInstance] executeArrayForKey:@"pre_main"];
}


@end
