//
//  MainMenuViewController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuTableViewCell.h"

@interface MainMenuViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *categories;

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
    self.categories = @[@"Popular",@"#TAGS",@"Settings"];
    
}

#pragma mark - TableView

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
    [cell configureTitle:self.categories[indexPath.row] background:@"MockBackground"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
