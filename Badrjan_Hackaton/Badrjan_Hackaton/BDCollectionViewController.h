//
//  BDCollectionViewController.h
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeButtonState <NSObject>

- (void)changeButtonState: (NSInteger *)count;

@end
@interface BDCollectionViewController : UICollectionViewController
@property (nonatomic) id <ChangeButtonState> delegate;
@end
