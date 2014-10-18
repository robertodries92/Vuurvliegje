//
//  InstaPicture.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "InstaPicture.h"

@implementation InstaPicture

- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        id location = data[@"location"];
        if ([location isKindOfClass:[NSDictionary class]]) {
            self.latitude = location[@"latitude"];
            self.longnitude = location[@"longitude"];
        }
        id url = data[@"images"];
        if (url) {
            self.highres_imageURL = url[@"standard_resolution"][@"url"];
            self.lowres_imageURL = url[@"low_resolution"][@"url"];
            self.thumb_imageURL = url[@"thumbnail"][@"url"];
        }
        id name = data[@"user"][@"full_name"];
        if (name) {
            self.username = name;
        }
        
    }
    return self;
}

@end
