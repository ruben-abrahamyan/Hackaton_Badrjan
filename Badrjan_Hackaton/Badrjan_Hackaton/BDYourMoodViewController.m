//
//  BDYourMoodViewController.m
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDYourMoodViewController.h"
#import "BDMoodTableViewCell.h"
#import "BDPhotoAnalyzingManager.h"
#import "MoodPercentages.h"
#import "BDUser.h"

@interface BDYourMoodViewController () <UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *findMusic;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *moodsArray;
@end

@implementation BDYourMoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.backgroundColor = [UIColor clearColor];
    self.findMusic.backgroundColor = [UIColor colorWithRed:145 / 255.0 green:215 / 255.0 blue:80 / 255.0 alpha:1.0];
    //[self.tableView registerClass:[BDMoodTableViewCell class] forCellReuseIdentifier:@"moodTableViewCell"];
    self.moodsArray = @[@"Sad",@"Happy"];
    
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(1, 0, 1, 0)];
    
    UIView *headerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 111)];
    headerContainer.backgroundColor = [UIColor clearColor];
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 110)];
    header.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(16, 20, header.frame.size.width, 60)];
    headerTitle.text = @"We think that\r you are";
//    title.text = @"We think that/n you are";
    headerTitle.textColor = [UIColor whiteColor];
    headerTitle.numberOfLines = 2;
    headerTitle.textAlignment = NSTextAlignmentLeft;
    headerTitle.font = [UIFont systemFontOfSize:24 weight:UIFontWeightHeavy];
    [header addSubview:headerTitle];
    [headerContainer addSubview:header];
    
    UIView *footerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 65)];
    footerContainer.backgroundColor = [UIColor clearColor];
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    footer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    
    UIButton *footerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 110)];
    footerButton.backgroundColor = [UIColor clearColor];
    [footerButton.titleLabel setText:@""];
    [footerButton addTarget:self
               action:@selector(tryAgain)
     forControlEvents:UIControlEventTouchUpInside];
    
    [footer addSubview:footerButton];
    
    UILabel *footerTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, header.frame.size.width, 60)];
    footerTitle.text = @"We Didn't Get It Right?\r Try Again!";
//    footerTitle.textColor = [UIColor colorWithRed:145 green:215 blue:80 alpha:1.0];
    footerTitle.textColor = [UIColor colorWithRed:145 / 255.0 green:215 / 255.0 blue:80 / 255.0 alpha:1.0];
    footerTitle.numberOfLines = 2;
    footerTitle.textAlignment = NSTextAlignmentCenter;
    footerTitle.font = [UIFont systemFontOfSize:20];
    [footer addSubview:footerTitle];
    [footerContainer addSubview:footer];
    
    self.tableView.tableHeaderView = headerContainer;
    self.tableView.tableFooterView = footer;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.moodsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BDMoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moodTableViewCell"];
    cell.moodLabel.text = self.moodsArray[indexPath.row];
    cell.moodLabel.textColor = [UIColor whiteColor];
    cell.contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    cell.backgroundColor = [UIColor clearColor];
    cell.preservesSuperviewLayoutMargins = false;
    cell.layoutMargins = UIEdgeInsetsZero;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            //[self performSegueWithIdentifier:@"goToYourMoodViewControllerSegueIdentifier" sender:self];
        }];
                });
    }];
}

- (void)tryAgain {
    [self openCamera];
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
