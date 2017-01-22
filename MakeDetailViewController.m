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
    
    self.makeNameArabicString = [[NSString alloc]initWithString:self.make.nameAr];
    self.makeNameEnglishString = [[NSString alloc]initWithString:self.make.nameEn];
    self.makeImageViewLargeURLString = [[NSString alloc]initWithString:self.make.imageLargeURL];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.makeImageViewLarge = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.makeImageViewLarge.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.makeImageViewLarge];
    
    self.makeImageViewLarge.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.makeImageViewLargeURLString]]];
    
    
    [self.makeImageViewLarge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
        make.leading.equalTo(self.view.mas_leading).with.offset(10);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(-10);
        make.top.equalTo(self.view.mas_top).with.offset(10);
    }];

    self.makeNameEnglish = [[UILabel alloc]init];
    [self.makeNameEnglish sizeToFit];
    self.makeNameEnglish.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.makeNameEnglish setTextAlignment:NSTextAlignmentCenter];
    [self.makeNameEnglish setTextColor:[UIColor whiteColor]];
    [self.makeNameEnglish setFont:[UIFont boldSystemFontOfSize:25]];
    [self.makeNameEnglish setText:self.makeNameEnglishString];
    [self.view addSubview:self.makeNameEnglish];
    
    
    [self.makeNameEnglish mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
        make.leading.equalTo(self.view.mas_leading).with.offset(10);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(-10);
        make.height.equalTo(@(90));
    }];

    self.makeNameArabic = [[UILabel alloc]init];
    [self.makeNameArabic sizeToFit];
    self.makeNameArabic.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.makeNameArabic setTextAlignment:NSTextAlignmentCenter];
    [self.makeNameArabic setTextColor:[UIColor whiteColor]];
    [self.makeNameArabic setFont:[UIFont boldSystemFontOfSize:25]];
    [self.makeNameArabic setText:self.makeNameArabicString];
    [self.view addSubview:self.makeNameArabic];
    
    
    [self.makeNameArabic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.makeNameEnglish.mas_top).with.offset(-10);
        make.leading.equalTo(self.view.mas_leading).with.offset(10);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(-10);
        make.height.equalTo(@(90));
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
