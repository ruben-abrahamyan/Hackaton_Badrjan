//
//  BDMainViewController.h
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDCollectionViewController.h"

@interface BDMainViewController : UIViewController <ChangeButtonState>
- (void)changeButtonState: (NSInteger *)count ;
@end
