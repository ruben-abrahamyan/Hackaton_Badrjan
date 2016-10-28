//
//  BDTabBarController.m
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/28/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDTabBarController.h"

@implementation BDTabBarController
-(void) viewDidLoad {
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, (self.tabBar.frame.size.height - 40)/2, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    btn.center = CGPointMake(self.tabBar.center.x, btn.center.y);
    [self.tabBar addSubview:btn];
}
@end
