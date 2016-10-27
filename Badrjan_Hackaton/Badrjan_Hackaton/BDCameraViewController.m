//
//  BDCameraViewController.m
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDCameraViewController.h"
#import "BDPhotoAnalyzingManager.h"

@interface BDCameraViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *selfieImageView;
@property (nonatomic) NSData *selectedImage;
@property (nonatomic) NSURL *selectedImageRL;
@end

@implementation BDCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    self.selfieImageView.image = chosenImage;
    self.selectedImage = UIImageJPEGRepresentation(chosenImage, 1.0);
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)bb:(id)sender {
   BDPhotoAnalyzingManager *analyzer = [[BDPhotoAnalyzingManager alloc] init];
    [analyzer analyzeImage:self.selectedImage withCompletion:^(BOOL success, NSDictionary *result) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
