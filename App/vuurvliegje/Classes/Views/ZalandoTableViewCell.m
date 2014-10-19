//
//  ZalandoTableViewCell.m
//  vuurvliegje
//
//  Created by Roberto Dries on 19/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "ZalandoTableViewCell.h"
#import <UIImageView+AFNetworking.h>

@interface ZalandoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation ZalandoTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configure:(ZalandoData *)data
{
    [self.imageView setImageWithURL:[NSURL URLWithString:data.imgURL]];
    self.titleLabel.text = data.productTitle;
    self.priceLabel.text = data.price;
}

@end
