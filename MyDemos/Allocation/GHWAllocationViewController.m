//
//  MainViewController.m
//  TimeProfilerDemo
//
//  Created by Leo on 2018/6/20.
//  Copyright © 2018年 Leo Huang. All rights reserved.
//

#import "GHWAllocationViewController.h"
#import <CoreImage/CoreImage.h>
#import "GHWAllocationImageLayout.h"
#import "GHWAllocationFlowImageCell.h"
#import "GHWAllocationDetailViewController.h"

@interface GHWAllocationViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,ImageLayoutDelegate>

@property (strong, nonatomic) UICollectionView * collectionView;

@property (strong, nonatomic) NSArray<UIImage *> * images;

@property (strong, nonatomic) UIActivityIndicatorView * spinner;

@end

@implementation GHWAllocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAllImages];
    [self.collectionView registerClass:[GHWAllocationFlowImageCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.spinner];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.spinner.center = self.view.center;
    self.collectionView.frame = self.view.bounds;
}

#pragma mark - CollectionView Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GHWAllocationFlowImageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.image = [self.images objectAtIndex:indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage * image = [self.images objectAtIndex:indexPath.item];
    GHWAllocationDetailViewController * dvc = [[GHWAllocationDetailViewController alloc] initWithImage:image];
    [self.navigationController pushViewController:dvc animated:YES];
}

#pragma mark - ImageLayout Delegate

- (CGSize)imageSizeForItemAtIndex:(NSIndexPath *)indexPath{
    return [self.images objectAtIndex:indexPath.item].size;
}

#pragma mark - Util

- (void)loadAllImages{
    [self.spinner startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray * images = [NSMutableArray new];
        for (long i = 1; i <= 20; i++) {
            NSString * imageName = [NSString stringWithFormat:@"image_%ld",i % 20 + 1];
            NSString * imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpeg"];
            UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
            [images addObject:[self filterdImage:image]];
        }
        self.images = [images copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
            [self.collectionView reloadData];
        });
    });
}

- (UIImage *)filterdImage:(UIImage *)originalImage{
    CIImage *inputImage = [CIImage imageWithCGImage:originalImage.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorMonochrome"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[CIColor colorWithRed:0.9 green:0.88 blue:0.12 alpha:1] forKey:kCIInputColorKey];
    [filter setValue:@0.5 forKey:kCIInputIntensityKey];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *outputImage = filter.outputImage;
    CGImageRef image = [context createCGImage:outputImage fromRect:outputImage.extent];
    UIImage * filterImage =  [UIImage imageWithCGImage:image];
//    CGImageRelease(image);
    return filterImage;
}

- (UIActivityIndicatorView *)spinner{
    if (!_spinner) {
        _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _spinner.hidesWhenStopped = YES;
    }
    return _spinner;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        GHWAllocationImageLayout * layout = [[GHWAllocationImageLayout alloc] init];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}


@end
