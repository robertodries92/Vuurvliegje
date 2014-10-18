//
//  WebserviceController.h
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface WebserviceController : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *manager;

- (id)initWithBaseURL:(NSString *)baseURL;

@end
