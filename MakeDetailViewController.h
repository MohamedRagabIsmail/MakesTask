//
//  MakeDetailViewController.h
//  Makes
//
//  Created by Mohamed Ragab on 1/10/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakeDetailViewController : UIViewController
@property (nonatomic, strong) UILabel* makeNameArabic;
@property (nonatomic, strong) NSString *makeNameArabicString;
@property (nonatomic, strong) UILabel* makeNameEnglish;
@property (nonatomic, strong) NSString *makeNameEnglishString;
@property (nonatomic, strong) UIImageView *makeImageViewLarge;
@property (nonatomic, strong) NSString *makeImageViewLargeURLString;
@end
