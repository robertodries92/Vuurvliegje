//
//  MainMenuViewController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "MainMenuViewController.h"
#import "InstaCollectionViewController.h"

#import "MainMenuTableViewCell.h"
#import "Defines.h"

@interface MainMenuViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray   *categories;
@property (nonatomic, strong) NSArray   *categoriesImages;
@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation MainMenuViewController

#pragma mark - lifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupMenu];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)setupMenu
{
    self.categories = @[@"Popular Pictures",@"# HashTags"];
    self.categoriesImages = @[@"MockBackground",@"hashtag_menu"];
}

#pragma mark - TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGRectGetHeight(self.view.bounds) - 120) / 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"menuCell";
    MainMenuTableViewCell *cell = (MainMenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    [cell configureTitle:self.categories[indexPath.row] background:self.categoriesImages[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:Segue_showInstaCollection sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[InstaCollectionViewController class]]) {
        InstaCollectionViewController *controller = segue.destinationViewController;
        controller.fetchType = self.selectedIndex;
    }
}


@end
