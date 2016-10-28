//
//  BDLoginViewController.m
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/28/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDUser.h"
#import "BDLoginViewController.h"
#import "BDLoadViewController.h"
@interface BDLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property(nonatomic) BDLoadViewController *loader;
@end

@implementation BDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernameField.layer.borderColor = [[UIColor colorWithRed:145 / 255.0 green:215 / 255.0 blue:80 / 255.0 alpha:1.0] CGColor];
    self.usernameField.layer.borderWidth = 1.f;
    [self.navigationController setNavigationBarHidden:YES];

    self.view.backgroundColor = [UIColor blackColor];
    self.loader = [[BDLoadViewController alloc] init];
    [self.loader show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
         [self.loader close];
    });
    
}

- (IBAction)loginButtonPressed:(id)sender {
    [[BDUser sharedUser] setUsername:self.usernameField.text];
    [self performSegueWithIdentifier:@"goToMainSegueIdentifier" sender:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


@end
