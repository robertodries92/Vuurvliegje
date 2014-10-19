//
//  InstaCollectionViewController.h
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LRInstagramFetchType) {
    LRInstagramFetchTypePopular = 0,
    LRInstagramFetchTypeTag
};

@interface InstaCollectionViewController : UIViewController

@property (nonatomic, assign) LRInstagramFetchType fetchType;

@end
