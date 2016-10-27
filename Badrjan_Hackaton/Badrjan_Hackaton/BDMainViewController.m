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
    self.buttonEnabled = NO;

}

- (void)changeButtonState: (NSInteger *)count {
    NSLog(@"%ld", count);
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BDCollectionViewController *vc = segue.destinationViewController;
    vc.delegate = self;
}

@end
