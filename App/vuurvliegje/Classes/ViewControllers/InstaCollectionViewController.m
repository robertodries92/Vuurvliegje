//
//  InstaCollectionViewController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "InstaCollectionViewController.h"
#import "InstaImageViewController.h"
#import "InstaPictureCollectionViewCell.h"
#import "SearchReusableView.h"

#import "InstagramController.h"
#import "InstaPicture.h"

#import "Defines.h"

@interface InstaCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,SearchReusableViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray      *instaPictures;
@property (nonatomic, strong) InstaPicture *selectedPicture;
@end

@implementation InstaCollectionViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

- (void)setFetchType:(LRInstagramFetchType)fetchType
{
    _fetchType = fetchType;
    switch (fetchType) {
        case LRInstagramFetchTypePopular:
            [self fetchPopular];
            break;
        case LRInstagramFetchTypeTag:
            break;
    }
}

#pragma mark - CollectionView

- (void)setupCollectionView
{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SearchReusableView * headerView = (SearchReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchReusableView" forIndexPath:indexPath];
    headerView.delegate = self;
    return headerView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (self.fetchType == LRInstagramFetchTypeTag) {
        return CGSizeMake(CGRectGetWidth(self.view.bounds), 43);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat sideSize = (CGRectGetWidth(self.view.bounds) - 20) / 3;
    return CGSizeMake(sideSize, sideSize);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.instaPictures.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"InstaPictureCell";
    InstaPictureCollectionViewCell *cell = (InstaPictureCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    InstaPicture *picture = self.instaPictures[indexPath.row];
    [cell loadImage:picture.thumb_imageURL];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedPicture = self.instaPictures[indexPath.row];
    [self performSegueWithIdentifier:Segue_showInstaPicture sender:self];
}

#pragma mark - Searchbar

- (void)searchReusableView:(SearchReusableView *)view didSearch:(NSString *)text
{
    [self fetchTag:text];
    [self.view endEditing:YES];
}

#pragma mark - Instagram fetch

- (void)fetchPopular
{
    __weak InstaCollectionViewController *weakSelf = self;
    [[InstagramController sharedInstance] fetchPopularPictures:^(NSArray *data, NSError *error) {
        weakSelf.instaPictures = data;
        [weakSelf.collectionView reloadData];
    }];
}

- (void)fetchTag:(NSString *)tag
{
    __weak InstaCollectionViewController *weakSelf = self;
    [[InstagramController sharedInstance] fetchPictureForTag:tag handler:^(NSArray *data, NSError *error) {
        weakSelf.instaPictures = data;
        [weakSelf.collectionView reloadData];
    }];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[InstaImageViewController class]]) {
        InstaImageViewController *controller = segue.destinationViewController;
        controller.picture = self.selectedPicture;
    }
}

@end
