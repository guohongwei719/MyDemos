//
//  GHWViewController.m
//  MyDemos
//
//  Created by 黑化肥发灰 on 2019/7/25.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWHomeViewController.h"

#import "GHWHomeTableViewCell.h"
#import <Masonry/Masonry.h>

#import "GHWBaseViewController.h"
#import "GHWAttributeViewController.h"
#import "GHWTouchViewController.h"
#import "GHWBitToSourceViewController.h"
#import "GHWLLDBViewController.h"
#import "GHWTimeProfileMainViewController.h"
#import "GHWTestViewController.h"
#import "GHWAllocationViewController.h"
#import "GHWBaiduAdViewController.h"
#import "JYTestViewController.h"

//当前控制器
UIViewController *AutoGetRoSourceViewController() {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *topVC = keyWindow.rootViewController;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    if ([topVC isKindOfClass:[UINavigationController class]]) {
        topVC = ((UINavigationController*)topVC).topViewController;
    }
    
    if ([topVC isKindOfClass:[UITabBarController class]]) {
        topVC = ((UITabBarController*)topVC).selectedViewController;
    }
    
    return topVC;
}

UINavigationController* AutoGetNavigationViewController(UIViewController *sourceVC) {
    
    UINavigationController *navigationController = nil;
    if ([sourceVC isKindOfClass:[UINavigationController class]]) {
        navigationController = (id)sourceVC;
    } else {
        UIViewController *superViewController = sourceVC.parentViewController;
        while (superViewController) {
            if ([superViewController isKindOfClass:[UINavigationController class]]) {
                navigationController = (id)superViewController;
                break;
            } else {
                superViewController = superViewController.parentViewController;
            }
        }
    }
    
    return navigationController;
}


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

- (void)configData {
    self.dataArray = @[
  @{@"测试一些问题": [JYTestViewController class]},
  @{@"插件": [GHWTestViewController class]},
                       @{@"启动项管理__attribute__": [GHWAttributeViewController class]},
                       @{@"响应事件机制": [GHWTouchViewController class]},
                       @{@"二进制源码映射": [GHWBitToSourceViewController class]},
                       @{@"LLDB": [GHWLLDBViewController class]},
                       @{@"Allocation 内存分配": [GHWAllocationViewController class]},
                       @{@"Time Profile": [GHWTimeProfileMainViewController class]},
                       @{@"百度广告": [GHWBaiduAdViewController class]}];
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
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    NSString *dicKey = [dic allKeys][0];
    GHWHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GHWHomeTableViewCell"];
    cell.labelTitle.text = [NSString stringWithFormat:@"%@. %@", @(indexPath.row + 1), dicKey];
    return cell;
}

#pragma mark - tableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    NSString *dicKey = [dic allKeys][0];
    Class cls = dic[dicKey];
    GHWBaseViewController *vc = [[cls alloc] init];
    vc.titleStr = dicKey;
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

#if DEBUG
@interface UIWindow (Motion)

// @override
- (BOOL)canBecomeFirstResponder;
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;

@end

@implementation UIWindow (Motion)
- (BOOL)canBecomeFirstResponder {//默认是NO，所以得重写此方法，设成YES
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [self showMenu];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"shake");
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
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
    [AutoGetRoSourceViewController() presentViewController:alertController animated:YES completion:nil];
}


@end

#endif


