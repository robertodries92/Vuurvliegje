//
//  SearchReusableView.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "SearchReusableView.h"

@interface SearchReusableView ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
@implementation SearchReusableView

- (void)setDelegate:(id<SearchReusableViewDelegate>)delegate
{
    _delegate = delegate;
    self.searchBar.delegate = self;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if (self.delegate) {
        [self.delegate searchReusableView:self didSearch:searchBar.text];
    }
}

@end
