//
//  BDMainViewController.m
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//
#import "BDMainViewController.h"


@interface BDMainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (nonatomic) BOOL buttonEnabled;


@end

@implementation BDMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)changeButtonState: (NSInteger *)count {
    int i = count;
    if(self.buttonEnabled) {
        if(i == 2) {
            self.buttonEnabled = NO;
            self.nextButton.enabled = NO;
            [self.nextButton setTitle:@"Pick at least 3" forState:UIControlStateNormal];
            return;
        }
        
    } else {
        if(i == 3) {
            self.buttonEnabled = YES;
            self.nextButton.enabled = YES;
            [self.nextButton setTitle:@"Show us how you feel" forState:UIControlStateNormal];
            return;
        }
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BDCollectionViewController *vc = segue.destinationViewController;
    vc.delegate = self;
}

@end
