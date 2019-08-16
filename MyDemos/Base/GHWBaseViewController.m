//
//  GHWBaseViewController.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/14.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWBaseViewController.h"

@interface GHWBaseViewController ()

@end

@implementation GHWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViews];
}

- (void)configViews {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.titleStr;
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
}

@end
