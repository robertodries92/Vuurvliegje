//
//  InstaPictureCollectionViewCell.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "InstaPictureCollectionViewCell.h"
#import <UIImageView+AFNetworking.h>

@interface InstaPictureCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation InstaPictureCollectionViewCell

- (void)loadImage:(NSString *)imageURL
{
    [self.imageView setImageWithURL:[NSURL URLWithString:imageURL]];
}

@end
