//
//  ZalandoController.h
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "WebserviceController.h"

typedef void (^zalandoHandler) (NSArray *data, NSError *error);

@interface ZalandoController : WebserviceController

+ (instancetype)sharedInstance;

- (void)fetchZoolandersWithImage:(NSString *)imageUrl handler:(zalandoHandler)handler;

@end
