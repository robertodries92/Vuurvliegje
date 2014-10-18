//
//  SearchReusableView.h
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchReusableView;
@protocol SearchReusableViewDelegate <NSObject>

- (void)searchReusableView:(SearchReusableView *)view didSearch:(NSString *)text;

@end
@interface SearchReusableView : UICollectionReusableView

@property (nonatomic, weak) id<SearchReusableViewDelegate> delegate;

@end
