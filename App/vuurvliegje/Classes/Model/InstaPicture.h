//
//  InstaPicture.h
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstaPicture : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *highres_imageURL;
@property (nonatomic, strong) NSString *lowres_imageURL;
@property (nonatomic, strong) NSString *thumb_imageURL;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longnitude;

- (id)initWithData:(NSDictionary *)data;

@end
