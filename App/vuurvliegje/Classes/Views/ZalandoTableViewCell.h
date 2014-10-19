//
//  ZalandoTableViewCell.h
//  vuurvliegje
//
//  Created by Roberto Dries on 19/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZalandoData.h"

@interface ZalandoTableViewCell : UITableViewCell

- (void)configure:(ZalandoData *)data;

@end
