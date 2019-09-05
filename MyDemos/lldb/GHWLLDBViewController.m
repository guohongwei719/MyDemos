//
//  GHWLLDBViewController.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/24.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWLLDBViewController.h"
#import "GHWLLDBObject.h"

/*
 lldb命令：
 image lookup -n 符号
 
 */

@interface GHWLLDBViewController ()

@end

@implementation GHWLLDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    Class cls = NSClassFromString(@"GHWLLDBObject");
    id obj = [[cls alloc] init];
    NSLog(@"%@, %@", cls, obj);
}


@end
