//
//  ZalandoData.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "ZalandoData.h"

@implementation ZalandoData

- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.imgURL = data[@"image_url"];
        self.zalandoURL = data[@"url"];
        self.price = data[@"price"];
    }
    return self;
}

@end
