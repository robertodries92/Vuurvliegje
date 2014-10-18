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
        id url = data[@"images"][@"standard_resolution"];
        if (url) {
            self.imageURL = url;
        }
        id name = data[@"caption"][@"from"][@"username"];
        if (name) {
            self.username = name;
        }
        
    }
    return self;
}

@end
