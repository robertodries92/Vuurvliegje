//
//  InstaCollectionViewController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "InstaCollectionViewController.h"
#import "InstagramController.h"

@interface InstaCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *instaPictures;

@end

@implementation InstaCollectionViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!self.fetchType) {
        self.fetchType = LRInstagramFetchTypePopular;
    }
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
        default:
            break;
    }
}

#pragma mark - CollectionView


#pragma mark - Instagram fetch

- (void)fetchPopular
{
    __weak InstaCollectionViewController *weakSelf = self;
    [[InstagramController sharedInstance] fetchPopularPictures:^(NSArray *data, NSError *error) {
        weakSelf.instaPictures = data;
    }];
}

- (void)fetchTag:(NSString *)tag
{
    __weak InstaCollectionViewController *weakSelf = self;
    [[InstagramController sharedInstance] fetchPictureForTag:tag handler:^(NSArray *data, NSError *error) {
        weakSelf.instaPictures = data;
    }];
}

- (void)hideSearchbar:(BOOL)setHidden
{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
