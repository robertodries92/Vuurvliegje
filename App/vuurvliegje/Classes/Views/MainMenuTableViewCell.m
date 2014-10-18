//
//  MainMenuTableViewCell.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "MainMenuTableViewCell.h"

@interface MainMenuTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *menuLabel;


@end
@implementation MainMenuTableViewCell

- (void)configureTitle:(NSString *)title background:(NSString *)imageName
{
    UIImage *img = [UIImage imageNamed:imageName];
    self.backgroundImageView.image = img;
    self.menuLabel.text = title;
}

@end
