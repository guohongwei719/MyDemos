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
    self.dataArray = @[@"测试", @"测试2"];
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
    cell.labelTitle.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - tableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


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
