//
//  BDMainViewController.m
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//
#import "BDMainViewController.h"
#import "BDPhotoAnalyzingManager.h"
#import "BDUser.h"
#import "BDYourMoodViewController.h"

@interface BDMainViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate,BDYourMoodViewControllerDelegate>
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
- (IBAction)goToNextController:(id)sender {
    [self openCamera];
}

- (void)openCamera {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self.navigationController presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    NSData *imageData = UIImageJPEGRepresentation(chosenImage, 1.0);
    BDPhotoAnalyzingManager *analyzer = [[BDPhotoAnalyzingManager alloc] init];
    [analyzer analyzeImage:imageData withCompletion:^(BOOL success, NSDictionary *result) {
        MoodPercentages *percentages = [[MoodPercentages alloc] initWithDictionary:result];
        [[BDUser sharedUser] setMoodPercentages:percentages];
        dispatch_async(dispatch_get_main_queue(), ^{
            [picker dismissViewControllerAnimated:YES completion:^{
            [self performSegueWithIdentifier:@"goToYourMoodViewControllerSegueIdentifier" sender:self];
            }];
        });
    }];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"goToYourMoodViewControllerSegueIdentifier"]) {
        return;
    }
    BDCollectionViewController *vc = segue.destinationViewController;
    vc.delegate = self;
}

@end
