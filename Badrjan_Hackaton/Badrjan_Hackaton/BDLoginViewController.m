//
//  BDLoginViewController.m
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/28/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDUser.h"
#import "BDLoginViewController.h"

@interface BDLoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@end

@implementation BDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernameField.layer.borderColor = [[UIColor colorWithRed:145 / 255.0 green:215 / 255.0 blue:80 / 255.0 alpha:1.0] CGColor];
    self.usernameField.layer.borderWidth = 1.f;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(id)sender {
    [[BDUser sharedUser] setUsername:self.usernameField.text];
    [self performSegueWithIdentifier:@"goToMainSegueIdentifier" sender:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
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
