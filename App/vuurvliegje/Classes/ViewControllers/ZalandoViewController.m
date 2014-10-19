//
//  ZalandoViewController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "ZalandoViewController.h"
#import "ZalandoTableViewCell.h"
#import "ZalandoData.h"

@interface ZalandoViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZalandoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"zalandoCell";
    ZalandoTableViewCell *cell = (ZalandoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    ZalandoData *data = self.items[indexPath.row];
    [cell configure:data];
    [cell setRemoteImage:data.imgURL inTableView:tableView atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *zalandoURL = ((ZalandoData *)self.items[indexPath.row]).zalandoURL;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:zalandoURL]];

}

@end
