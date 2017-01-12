//
//  ViewController.h
//  Makes
//
//  Created by Mohamed Ragab on 1/8/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *makesCollectionView;
@end

