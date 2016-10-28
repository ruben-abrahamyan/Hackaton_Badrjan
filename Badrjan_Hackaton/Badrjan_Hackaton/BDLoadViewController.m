//
//  BDLoadViewController.m
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/28/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDLoadViewController.h"

@interface BDLoadViewController ()
@property (nonatomic) UIWindow *window;
@property (nonatomic) UIImage *loadingImage;
@property (nonatomic) UIImageView *imageView;
@end

@implementation BDLoadViewController

@synthesize window;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.f - 150/2.f, self.view.frame.size.height/2.f - 150*559/500.f/2.f, 150, 150*559/500.f)];
    [self.view addSubview:self.imageView];
    self.loadingImage = [UIImage animatedImageNamed:@"Chapter-" duration:0.75f];
    self.imageView.image = self.loadingImage;
}


- (void) show {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.windowLevel = UIWindowLevelStatusBar;
    self.window.opaque = NO;
    self.window.hidden = NO;
    self.window.rootViewController = self;
    [self.window addSubview:self.view];
    
    self.view.frame = [UIScreen mainScreen].bounds;
}

- (void)close {
    [self.view removeFromSuperview];
    [self.window removeFromSuperview];
    self.window = nil;
    
}


@end
