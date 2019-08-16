//
//  GHWViewController.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/7/25.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWHomeViewController.h"

#import "GHWHomeTableViewCell.h"
#import <Masonry/Masonry.h>

#import "GHWBaseViewController.h"
#import "GHWAttributeViewController.h"
#import "GHWTouchViewController.h"


@interface GHWHomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation GHWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self configView];
}

- (void)testUnUsedMethod {
    NSLog(@"testUnUsedMethod");
}

__attribute__((constructor))
void premain() {
    [RAMExport.sharedInstance executeArrayForKey:@"pre_main"];
}

- (void)configData {
    self.dataArray = @[@"__attribute__", @"响应事件机制"];
    
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
}



- (void)configView {
    self.title = @"demos";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(@([UIDevice stautsBarAndNaviBarHeight]));
    }];
}

#pragma mark - tableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GHWHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GHWHomeTableViewCell"];
    cell.labelTitle.text = [NSString stringWithFormat:@"%@. %@", @(indexPath.row + 1), self.dataArray[indexPath.row]];
    return cell;
}

#pragma mark - tableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GHWBaseViewController *vc;
    if (indexPath.row == 0) {
        vc = [[GHWAttributeViewController alloc] init];
    } else if (indexPath.row == 1) {
        vc = [[GHWTouchViewController alloc] init];
    }
    vc.titleStr = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - ShakeToEdit 摇动手机之后的回调方法

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    //检测到摇动开始
    if (motion == UIEventSubtypeMotionShake) {
        // your code
        NSLog(@"检测到摇动开始");
        [self showMenu];
    }
}

- (void)showMenu {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *exportAction = [UIAlertAction actionWithTitle:@"导出当前UI结构" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Lookin_Export" object:nil];
    }];
    UIAlertAction *seeElementAction = [UIAlertAction actionWithTitle:@"审查元素" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Lookin_2D" object:nil];
    }];
    UIAlertAction *threeDAction = [UIAlertAction actionWithTitle:@"3D 视图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Lookin_3D" object:nil];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    
    [alertController addAction:exportAction];
    [alertController addAction:seeElementAction];
    [alertController addAction:threeDAction];
    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - getter & setter

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)){
            _mainTableView.estimatedRowHeight = 0;
            _mainTableView.estimatedSectionFooterHeight = 0;
            _mainTableView.estimatedSectionHeaderHeight = 0;
            _mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_mainTableView registerClass:[GHWHomeTableViewCell class] forCellReuseIdentifier:@"GHWHomeTableViewCell"];
    }
    return _mainTableView;
}



@end
