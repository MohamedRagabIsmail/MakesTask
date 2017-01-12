//
//  MakeDetailViewController.m
//  Makes
//
//  Created by Mohamed Ragab on 1/10/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import "MakeDetailViewController.h"
#import "Masonry.h"


@interface MakeDetailViewController ()

@end

@implementation MakeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.makeImageViewLarge = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.makeImageViewLarge.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.makeImageViewLarge];
    
    self.makeImageViewLarge.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.makeImageViewLargeURLString]]];
    
    UIEdgeInsets makeImageViewPadding = UIEdgeInsetsMake(10 , 10, 10, 10);
    
    [self.makeImageViewLarge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(makeImageViewPadding);
    }];

    self.makeNameArabic = [[UILabel alloc]init];
    [self.makeNameArabic sizeToFit];
    self.makeNameArabic.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.makeNameArabic setTextAlignment:NSTextAlignmentCenter];
    [self.makeNameArabic setTextColor:[UIColor whiteColor]];
    [self.makeNameArabic setFont:[UIFont boldSystemFontOfSize:25]];
    [self.makeNameArabic setText:self.makeNameArabicString];
    [self.view addSubview:self.makeNameArabic];
    
    
    UIEdgeInsets makeArabicLabelPadding = UIEdgeInsetsMake(self.view.bounds.size.height*0.75f , 10, self.view.bounds.size.height*0.125f, 10);
    
    [self.makeNameArabic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(makeArabicLabelPadding);
    }];
    
    self.makeNameEnglish = [[UILabel alloc]init];
    [self.makeNameEnglish sizeToFit];
    self.makeNameEnglish.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.makeNameEnglish setTextAlignment:NSTextAlignmentCenter];
    [self.makeNameEnglish setTextColor:[UIColor whiteColor]];
    [self.makeNameEnglish setFont:[UIFont boldSystemFontOfSize:25]];
    [self.makeNameEnglish setText:self.makeNameEnglishString];
    [self.view addSubview:self.makeNameEnglish];
    
    
    UIEdgeInsets makeEnglishLabelPadding = UIEdgeInsetsMake(self.view.bounds.size.height*(0.75f+0.125f) , 10, 10, 10);
    
    [self.makeNameEnglish mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(makeEnglishLabelPadding);
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
