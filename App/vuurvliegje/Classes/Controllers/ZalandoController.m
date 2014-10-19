//
//  ZalandoController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "ZalandoController.h"
#import "Defines.h"
#import "ZalandoData.h"

@implementation ZalandoController

+ (instancetype)sharedInstance
{
    static ZalandoController *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ZalandoController alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    self = [super initWithBaseURL:ZALANDO_BASE_URL];
    if (self) {
        
    }
    return self;
}

- (void)fetchZoolandersWithImage:(NSString *)imageUrl handler:(zalandoHandler)handler
{
    NSDictionary *params = @{@"image_url":imageUrl};
    [self.manager POST:ZALANDO_IMAGE_RECOGNITION parameters:params
               success:^(NSURLSessionDataTask *task, id responseObject) {
                   NSDictionary *items = responseObject[@"zalando_products"];
                   NSMutableArray *zalaItems = [@[] mutableCopy];
                   for (NSDictionary *item in items) {
                       ZalandoData *zalaItem = [[ZalandoData alloc]initWithData:item];
                       [zalaItems addObject:zalaItem];
                   }
                   handler(zalaItems,nil);
               } failure:^(NSURLSessionDataTask *task, NSError *error) {
                   handler(nil,error);
               }];
}

@end
