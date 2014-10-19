//
//  ZalandoData.h
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZalandoData : NSObject
@property (nonatomic, strong) NSString *imgURL;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *zalandoURL;

- (id)initWithData:(NSDictionary *)data;

@end
