//
//  WebserviceController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "WebserviceController.h"

@interface WebserviceController ()

@end
@implementation WebserviceController

- (id)initWithBaseURL:(NSString *)baseURL
{
    self = [super init];
    if (self) {
        
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLCache *cache = [[NSURLCache alloc]initWithMemoryCapacity:0 diskCapacity:0 diskPath:nil];
        [sessionConfig setURLCache:cache];
        self.manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:baseURL]
                                               sessionConfiguration:sessionConfig];
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

@end
