//
//  LoadingViewController.m
//  vuurvliegje
//
//  Created by Roberto Dries on 18/10/14.
//  Copyright (c) 2014 LAROB. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstLabelXConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondLabelXConstraint;
@property (nonatomic, strong) NSArray *loadingTexts;
@property (nonatomic, assign) NSInteger textIndex;
@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadingTexts = @[@"IK",@"GA",@"ZO",@"NAAR",@"EEN",@"CLUB",@"OM",@"EEN",@"GIN",@"TE",@"DRINKEN"];
    self.textIndex = 0;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self animateNextText];

}

- (void)animateNextText
{
    self.textIndex++;
    
    if (self.textIndex >= [self.loadingTexts count]) {
        self.textIndex = 0;
    }
    
    [self animateText:self.loadingTexts[self.textIndex]];
    [self performSelector:@selector(animateNextText) withObject:nil afterDelay:3.0f];
}

- (void)animateText:(NSString *)text {
    self.secondLabel.text = self.firstLabel.text;
    self.secondLabelXConstraint.constant = self.firstLabelXConstraint.constant;
    
    self.firstLabelXConstraint.constant = -CGRectGetWidth(self.view.bounds);
    self.firstLabel.text = text;
    
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:.8f animations:^{
        self.firstLabelXConstraint.constant = 0;
        self.secondLabelXConstraint.constant = CGRectGetWidth(self.view.bounds);
        [self.view layoutIfNeeded];
    
    }];
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
