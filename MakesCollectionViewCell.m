//
//  MakesCollectionViewCell.m
//  Makes
//
//  Created by Mohamed Ragab on 1/9/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import "MakesCollectionViewCell.h"
#import "Masonry.h"
#import <QuartzCore/QuartzCore.h>

@implementation MakesCollectionViewCell
- (UIImageView *)makeImageView {
    if (!_makeImageView) {
        _makeImageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _makeImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _makeImageView;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
        [self.contentView addSubview:self.makeImageView];
        
        
        [self.contentView addSubview: self.makeName];
        [self.contentView bringSubviewToFront: self.makeName];
        
        
        
        [self.makeName sizeToFit]; //added
        
        
        [self.makeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
            make.leading.equalTo(self.contentView.mas_leading).with.offset(10);
            make.trailing.equalTo(self.contentView.mas_trailing).with.offset(-10);
            make.height.equalTo(@(25));
        }];
        
        self.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
        
       _makeName.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        _makeName.layer.cornerRadius = 10.0f;
        _makeName.layer.masksToBounds = YES;

        self.layer.cornerRadius = 20.0f;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 3.0f;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return self;
}

- (UILabel*) makeName {
    if(!_makeName){
        _makeName = [[UILabel alloc]init];
        _makeName.textAlignment = NSTextAlignmentCenter;
        _makeName.textColor = [UIColor darkGrayColor];
        _makeName.font = [UIFont boldSystemFontOfSize:15];
        _makeName.text = @"Default";
        
    }
    return _makeName;
}
@end
