//
//  Defines.h
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

static NSString * const INSTAGRAM_CLIENT_ID     = @"a829fdbcee63425183189cda178191c3";
static NSString * const INSTAGRAM_CLIENT_SECRET = @"27c3fdf875084073a03b4e6cd80814fc";

static NSString * const INSTAGRAM_BASE_URL = @"https://api.instagram.com";
static NSString * const INSTAGRAM_SEARCH_POPULAR = @"/v1/media/popular?client_id=%@"; //CLIENT-ID
static NSString * const INSTAGRAM_SEARCH_TAGS = @"/v1/tags/%@/media/recent?client_id=%@"; //TAG-NAME, CLIENT-ID
static NSString * const INSTAGRAM_SEARCH_USER = @"v1/users/search?q=%@&client_id=%@"; //USERNAME, CLIENT-ID