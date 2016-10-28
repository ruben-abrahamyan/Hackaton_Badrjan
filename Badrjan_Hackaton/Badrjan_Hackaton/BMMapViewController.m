//
//  BMMapViewController.m
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/28/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BMMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "BDFakeUser.h"
#import "BDUser.h"

@interface BMMapViewController () <CLLocationManagerDelegate,  MKMapViewDelegate>
@property (nonatomic) CLLocationManager* locManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) NSMutableArray *fakeUsers;
@property (nonatomic) CLLocationCoordinate2D currentlocation;
@property (nonatomic) UIView *viewik;
@end

@implementation BMMapViewController
@synthesize locManager;
@synthesize viewik;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.delegate = self;
    locManager = [[CLLocationManager alloc] init];
    [locManager setDelegate:self];
    [locManager setDesiredAccuracy:kCLLocationAccuracyBest];
    if ([self.locManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locManager requestWhenInUseAuthorization];
    }
    [locManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 1500, 1500);
    self.currentlocation = userLocation.location.coordinate;
    [self.mapView setRegion:region animated:YES];
    [self createFakeUser];
}

- (void) createFakeUser {
    BDFakeUser *user = [[BDFakeUser alloc] init];
    user.latitude = self.currentlocation.latitude;
    user.longitude = self.currentlocation.longitude;
    user.currentMood = @"Sad";
    user.currentTrack = @"Jrimurmurner - anharmara im mej";
    
    if(!self.viewik) {
        self.viewik = [[UIView alloc] initWithFrame:CGRectMake(user.latitude + 50, user.longitude + 100, 200, 200)];
        viewik.backgroundColor = [UIColor clearColor];
        
        UIView *trackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewik.frame.size.width, 20)];
        trackView.backgroundColor = [UIColor colorWithRed:217/255.0f green:70/255.0f blue:106/255.0f alpha:0.8];
        trackView.layer.cornerRadius = 3;
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, trackView.frame.size.width, 20)];
        title.text = user.currentTrack;
        [trackView addSubview:title];
        
        UIImageView *mood = [[UIImageView alloc] initWithFrame:CGRectMake((viewik.frame.size.width - 50)/2, trackView.frame.origin.y + 25, 39, 50)];
        mood.image = [UIImage imageNamed:@"happy"];
        [viewik addSubview:mood];
        
        [viewik addSubview:trackView];
        
        [self.mapView addSubview:viewik];
    }
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
