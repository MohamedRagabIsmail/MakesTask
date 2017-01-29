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
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tires"]];
    [backgroundImage setFrame:self.view.frame];
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    backgroundImage.contentMode = UIViewContentModeScaleToFill;
    
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

    self.makeNameEnglishLabel = [[UILabel alloc]init];
    [self.makeNameEnglishLabel sizeToFit];
    self.makeNameEnglishLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.makeNameEnglishLabel setTextAlignment:NSTextAlignmentCenter];
    [self.makeNameEnglishLabel setTextColor:[UIColor whiteColor]];
    [self.makeNameEnglishLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [self.makeNameEnglishLabel setText:self.make.nameEn];
    [self.view addSubview:self.makeNameEnglishLabel];
    
    
    [self.makeNameEnglishLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
        make.leading.equalTo(self.view.mas_leading).with.offset(10);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(-10);
        make.height.equalTo(@(90));
    }];

    self.makeNameArabicLabel = [[UILabel alloc]init];
    [self.makeNameArabicLabel sizeToFit];
    self.makeNameArabicLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [self.makeNameArabicLabel setTextAlignment:NSTextAlignmentCenter];
    [self.makeNameArabicLabel setTextColor:[UIColor whiteColor]];
    [self.makeNameArabicLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [self.makeNameArabicLabel setText:self.make.nameAr];
    [self.view addSubview:self.makeNameArabicLabel];
    
    
    [self.makeNameArabicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.makeNameEnglishLabel.mas_top).with.offset(-10);
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
