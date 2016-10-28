//
//  BDLoginViewController.m
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/28/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDLoginViewController.h"
#import "BDLoadViewController.h"
@interface BDLoginViewController ()
@property(nonatomic) BDLoadViewController *loader;
@end

@implementation BDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.loader = [[BDLoadViewController alloc] init];
    [self.loader show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
         [self.loader close];
    });
    
}

- (IBAction)loginButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"goToMainSegueIdentifier" sender:self];
}

@end
