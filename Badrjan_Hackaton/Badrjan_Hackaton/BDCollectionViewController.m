//
//  BDCollectionViewController.m
//  Badrjan_Hackaton
//
//  Created by Ruben Abrahamyan on 10/27/16.
//  Copyright © 2016 Badrjan. All rights reserved.
//

#import "BDCollectionViewController.h"
#import "BDCollectionViewCell.h"
#import "BDUser.h"

@interface BDCollectionViewController ()
@property (nonatomic, strong) NSArray *styleArray;
@property (nonatomic, strong) NSMutableArray *indexSelectedArray;
@property (nonatomic) CGFloat cellWidth;
@end

@implementation BDCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.styleArray = [NSArray arrayWithObjects: @"POP", @"ROCK", @"BLUES", @"METAL", @"HIP-HOP", @"WORLD", @"JAZZ", @"CLASSICAL", @"REGGAE", @"ELECTRO", nil];
    self.indexSelectedArray = [[NSMutableArray alloc] initWithCapacity:self.styleArray.count];
    for(int i = 0; i < self.styleArray.count; i++) {
        [self.indexSelectedArray addObject:[NSNumber numberWithBool:NO]];
    }
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
        /*BOOL selected = [self.indexSelectedArray[indexPath.item] boolValue];
        cell.isSelected = selected;
        [cell changeCellSize];*/
    // Configure the cell
    
    cell.backgroundColor = [UIColor magentaColor];
    cell.title.text = self.styleArray[indexPath.item];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.cellWidth, self.cellWidth);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    BDCollectionViewCell *cell = (BDCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    BOOL selected = [self.indexSelectedArray[indexPath.item] boolValue];
    selected = !selected;
    cell.cellIsSelected = selected;
    [cell changeCellSize];
    [self.indexSelectedArray replaceObjectAtIndex:indexPath.item withObject:[NSNumber numberWithBool:selected]];
    //[self.collectionView reloadData];
    if(selected) {
        /*[[BDUser sharedUser].preferredStyle addObject:[NSString stringWithFormat:@"%@", cell.title.text]];
        NSLog(@"%@", cell.title.text);
        NSLog(@"%@", [BDUser sharedUser].preferredStyle);*/
        
    } else {
        /*[[BDUser sharedUser].preferredStyle removeObject:[NSString stringWithFormat:@"%@", cell.title.text]];
        NSLog(@"%@", [BDUser sharedUser].preferredStyle);*/
        
    }
}

@end
