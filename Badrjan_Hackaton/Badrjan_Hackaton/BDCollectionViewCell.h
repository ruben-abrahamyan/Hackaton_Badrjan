//
//  BDCollectionViewCell.h
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
