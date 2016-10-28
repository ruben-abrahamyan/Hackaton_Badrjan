//
//  BDYourMoodViewController.h
//  Badrjan_Hackaton
//
//  Created by AnnaSakhlyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BDYourMoodViewControllerDelegate <NSObject>
- (void) openPicker;
@end

@interface BDYourMoodViewController : UIViewController
@property (nonatomic,weak) id <BDYourMoodViewControllerDelegate> delegate;
@end
