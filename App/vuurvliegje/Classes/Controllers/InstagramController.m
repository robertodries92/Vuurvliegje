//
//  InstagramController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "InstagramController.h"
#import "InstaPicture.h"
#import "Defines.h"

@implementation InstagramController

+ (instancetype)sharedInstance
{
    static InstagramController *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[InstagramController alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    self = [super initWithBaseURL:INSTAGRAM_BASE_URL];
    if (self) {
        
    }
    return self;
}

- (void)fetchPopularPictures:(instaHandler)handler
{
    NSString *URL = [NSString stringWithFormat:INSTAGRAM_SEARCH_POPULAR,INSTAGRAM_CLIENT_ID];
    [self.manager GET:URL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dataList = responseObject[@"data"];
        NSMutableArray *pictures = [@[] mutableCopy];
        for (NSDictionary *pictureDictionary in dataList) {
            InstaPicture *picture = [[InstaPicture alloc]initWithData:pictureDictionary];
            [pictures addObject:picture];
        }
        handler(pictures,nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handler(nil,error);
    }];
}

- (void)fetchPictureForTag:(NSString *)tag handler:(instaHandler)handler
{
    NSString *URL = [NSString stringWithFormat:INSTAGRAM_SEARCH_TAGS,tag,INSTAGRAM_CLIENT_ID];
    [self.manager GET:URL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

@end
