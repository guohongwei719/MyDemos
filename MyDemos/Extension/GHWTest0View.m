#import "GHWTest0View.h"
@interface GHWTest0View () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *testTableView;


@end

@implementation GHWTest0View

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configViews];
    }
    return self;
}

- (void)configViews {

}

#pragma mark - Public Methods

#pragma mark - Private Methods

#pragma mark - tableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (indexPath.row % 2 == 0) {
        cell.contentView.backgroundColor = [UIColor blueColor];
     } else {
        cell.contentView.backgroundColor = [UIColor redColor];
    }
    return cell;
}

#pragma mark - tableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


#pragma mark - Setter / Getter
- (UITableView *)testTableView {
    if (!_testTableView) {
        _testTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _testTableView.delegate = self;
        _testTableView.dataSource = self;
        _testTableView.backgroundColor = [UIColor whiteColor];
        _testTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _testTableView.estimatedRowHeight = 0;
            _testTableView.estimatedSectionFooterHeight = 0;
            _testTableView.estimatedSectionHeaderHeight = 0;
            _testTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_testTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _testTableView;
}




@end
