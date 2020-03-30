//
//  JYTestViewController.m
//  MyDemos
//
//  Created by guohongwei on 2020/3/30.
//  Copyright © 2020 Jingyao. All rights reserved.
//

#import "JYTestViewController.h"

@interface JYTestViewController ()

@property (strong) NSString *str1;
@property (copy) NSString *str2;
@end

@implementation JYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *str = @"a";
    self.str1 = str;
    self.str2 = str;
    str = @"b";
    NSLog(@"%@%@",self.str1,self.str2);
}

- (NSString *)str1 {
    return @"c";
}

@synthesize str1 = _str1;
- (void)setStr1:(NSString *)str1 {
    _str1 = str1;
}



@end
