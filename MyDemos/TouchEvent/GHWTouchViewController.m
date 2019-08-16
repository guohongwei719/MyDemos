//
//  GHWTouchViewController.m
//  MyDemos
//
//  Created by 郭宏伟 on 2019/8/15.
//  Copyright © 2019 Jingyao. All rights reserved.
//

#import "GHWTouchViewController.h"

#import "GHWEventAView.h"
#import "GHWEventBView.h"
#import "GHWEventCView.h"
#import "GHWEventDView.h"
#import "GHWEventEView.h"
#import "GHWEventButton.h"

@interface GHWTouchViewController ()

@property (nonatomic, strong) GHWEventAView *aView;
@property (nonatomic, strong) GHWEventBView *bView;
@property (nonatomic, strong) GHWEventCView *cView;
@property (nonatomic, strong) GHWEventDView *dView;
@property (nonatomic, strong) GHWEventEView *eView;

@end

@implementation GHWTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.aView];
    [self.aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.aView addSubview:self.bView];
    [self.bView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@([UIDevice stautsBarAndNaviBarHeight] + 20));
        make.left.equalTo(@(40));
        make.right.equalTo(self.aView.mas_right).offset(-40);
        make.bottom.equalTo(self.aView.mas_centerY).offset(-20);
    }];
    
    [self.aView addSubview:self.cView];
    [self.cView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.aView.mas_centerY).offset(20);
        make.left.equalTo(@(40));
        make.right.equalTo(self.aView.mas_right).offset(-40);
        make.bottom.equalTo(self.aView.mas_bottom).offset(-40);
    }];
    
    [self.cView addSubview:self.dView];
    [self.dView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(40));
        make.left.equalTo(@(40));
        make.right.equalTo(self.cView.mas_right).offset(-40);
        make.bottom.equalTo(self.cView.mas_centerY).offset(-20);
    }];
    
    [self.cView addSubview:self.eView];
    [self.eView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cView.mas_centerY).offset(20);
        make.left.equalTo(@(40));
        make.right.equalTo(self.cView.mas_right).offset(-40);
        make.bottom.equalTo(self.cView.mas_bottom).offset(-20);
    }];
}

- (GHWEventAView *)aView {
    if (!_aView) {
        _aView = [[GHWEventAView alloc] init];
        _aView.backgroundColor = [UIColor whiteColor];
    }
    return _aView;
}

- (GHWEventBView *)bView {
    if (!_bView) {
        _bView = [[GHWEventBView alloc] init];
        _bView.backgroundColor = [UIColor lightGrayColor];
    }
    return _bView;
}

- (GHWEventCView *)cView {
    if (!_cView) {
        _cView = [[GHWEventCView alloc] init];
        _cView.backgroundColor = [UIColor lightGrayColor];
    }
    return _cView;
}

- (GHWEventDView *)dView {
    if (!_dView) {
        _dView = [[GHWEventDView alloc] init];
        _dView.backgroundColor = [UIColor blueColor];
    }
    return _dView;
}

- (GHWEventEView *)eView {
    if (!_eView) {
        _eView = [[GHWEventEView alloc] init];
        _eView.backgroundColor = [UIColor blueColor];
    }
    return _eView;
}
@end
