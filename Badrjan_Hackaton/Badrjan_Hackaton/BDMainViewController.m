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

@interface BDMainViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (nonatomic) BOOL buttonEnabled;
@property (nonatomic) UIImageView *imgView;
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@end

@implementation BDMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:37 / 255.0 green:37 / 255.0 blue:37 / 255.0 alpha:1.0];
}

- (void)changeButtonState: (NSInteger *)count {
    int i = count;
    if(self.buttonEnabled) {
        if(i == 2) {
            self.buttonEnabled = NO;
            self.nextButton.enabled = NO;
            [self.nextButton setTitle:@"Pick at least 3 to Continue" forState:UIControlStateNormal];
            self.nextButton.backgroundColor = [UIColor colorWithRed:136.f/255.0f
                            green:136.f/255.0f
                             blue:136.f/255.0f
                            alpha:1.f];
            [self.imgView removeFromSuperview];
            self.imgView = nil;
            return;
        }
        
    } else {
        if(i == 3) {
            self.buttonEnabled = YES;
            self.nextButton.enabled = YES;
            [self.nextButton setTitle:@"Show Us How You Feel" forState:UIControlStateNormal];
            self.nextButton.backgroundColor = [UIColor colorWithRed:143.f/255.0f
                                                              green:217.f/255.0f
                                                               blue:70/255.0f
                                                              alpha:1.f];
            CGSize size = [self.nextButton.titleLabel.text sizeWithFont:[UIFont systemFontOfSize:17]];
            self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.nextButton.frame.size.width/2.f + size.width/2.f + 4,
                                                                         CGRectGetMidY(self.nextButton.titleLabel.frame) - 6, 14, 12)];
            self.imgView.image = [UIImage imageNamed:@"arrow"];
            [self.nextButton addSubview:self.imgView];
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
    }];
    [picker dismissViewControllerAnimated:YES completion:^{
        [self performSegueWithIdentifier:@"goToYourMoodViewControllerSegueIdentifier" sender:self];
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
