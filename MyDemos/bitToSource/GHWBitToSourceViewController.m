//
//  GHWBitToSourceViewController.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/20.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWBitToSourceViewController.h"
#import <MapSourceTest/MapSourceTest.h>
@interface GHWBitToSourceViewController ()

@end

@implementation GHWBitToSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GHWMapSourceTest *test = [[GHWMapSourceTest alloc] init];
    [test testFail];

    NSLog(@"ok");
}


@end
