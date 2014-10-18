//
//  InstaImageViewController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "InstaImageViewController.h"
#import <UIImageView+AFNetworking.h>
#import "Defines.h"

@interface InstaImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation InstaImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageView setImageWithURL:[NSURL URLWithString:self.picture.highres_imageURL]];
}


- (IBAction)didTapZalandoButton:(id)sender {
    [self performSegueWithIdentifier:Segue_showLoadingController sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
