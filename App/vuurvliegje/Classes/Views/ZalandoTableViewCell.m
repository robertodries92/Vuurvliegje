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
    self.titleLabel.text = data.productTitle;
    self.priceLabel.text = data.price;
}

- (void)setRemoteImage:(NSString *)remoteImageURLString inTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:remoteImageURLString]];
    __weak UITableView *weakTableView = tableView;
    __weak UITableViewCell *weakSelf = self;
    __weak UIImageView *weakImageView = self.productImageView;
    [self.productImageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if ([weakTableView.visibleCells containsObject:weakSelf]) {
            [UIView transitionWithView:weakImageView duration:0.15f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                weakImageView.image = image;
            } completion:NULL];
        }
        else {
            weakImageView.image = image;
        }
    } failure:nil];
}


@end
