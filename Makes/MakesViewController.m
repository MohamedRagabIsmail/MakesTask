//
//  ViewController.m
//  Makes
//
//  Created by Mohamed Ragab on 1/8/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import "MakesViewController.h"
#import "Make.h"
#import <AFNetworking/AFNetworking.h>
#import <Masonry/Masonry.h>
#import "MakesCollectionViewCell.h"
#import "MakeDetailViewController.h"
#import "MakesManager.h"
#import <SDWebImage/UIImageView+WebCache.h>


static NSString * const MakesCollectionViewCellIdentifer = @"MakesCollectionViewCellIdentifer";

@interface MakesViewController ()
@property (nonatomic, strong) NSArray *makes;
@property (nonatomic, strong) UICollectionView *makesCollectionView;
@end

@implementation MakesViewController

- (void)loadMakes {
    
    [[MakesManager manager] makesWithsuccess:^(NSArray *makes) {
        self.makes = makes;
        [self.makesCollectionView reloadData];
    } failure:^(NSError *error) {
        
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.title = @"Makes";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self.makesCollectionView =[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.makesCollectionView setDataSource:self];
    [self.makesCollectionView setDelegate:self];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tire_pattern"]];
    self.view.backgroundColor = [UIColor blackColor];
    self.makesCollectionView.backgroundView = backgroundImage;
    

    
    [self.makesCollectionView setBackgroundColor:[UIColor whiteColor]];
    [self.makesCollectionView registerClass:[MakesCollectionViewCell class] forCellWithReuseIdentifier:MakesCollectionViewCellIdentifer];
    [self.view addSubview:self.makesCollectionView];
    
    
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self.makesCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);
    }];
    
    [self loadMakes];

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.makes.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MakesCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:MakesCollectionViewCellIdentifer forIndexPath:indexPath];
        
    Make* make = [self.makes objectAtIndex:indexPath.item];
    
    [cell.makeImageView sd_setImageWithURL:[NSURL URLWithString:make.imageSmallURL]
                 placeholderImage:nil
                          options:SDWebImageRefreshCached];
    
    cell.makeName.text = make.nameAr;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MakeDetailViewController* makeDetailVC = [[MakeDetailViewController alloc]init];
    Make* currentMake = [self.makes objectAtIndex:indexPath.item];
    makeDetailVC.make = currentMake;
    [self.navigationController pushViewController:makeDetailVC animated:YES];
    

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120, 120);
}

@end
