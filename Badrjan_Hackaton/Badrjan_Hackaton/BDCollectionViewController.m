//
//  BDCollectionViewController.m
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDCollectionViewController.h"
#import "BDCollectionViewCell.h"

@interface BDCollectionViewController ()
@property (nonatomic, copy) NSArray *styleArray;
@property (nonatomic) CGFloat cellWidth;
@end

@implementation BDCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.styleArray = [NSArray arrayWithObjects: @"POP", @"ROCK", @"BLUES", @"METAL", @"HIP-HOP", @"INDIE", @"JAZZ", @"CLASSICAL", @"REGGAE", @"ELECTRO", nil];
    self.cellWidth = (self.collectionView.frame.size.width - 2)/2.f;
    [self.collectionView registerNib:[UINib nibWithNibName:@"BDCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.styleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor magentaColor];
    cell.title.text = self.styleArray[indexPath.item];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.cellWidth, self.cellWidth);
}
/*
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 2, 0); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 2;
}*/
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
