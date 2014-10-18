//
//  InstagramController.h
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "WebserviceController.h"

typedef void (^instaHandler) (NSArray *data, NSError *error);

@interface InstagramController : WebserviceController

+ (instancetype)sharedInstance;

- (void)fetchPopularPictures:(instaHandler)handler;
- (void)fetchPictureForTag:(NSString *)tag handler:(instaHandler)handler;

@end
