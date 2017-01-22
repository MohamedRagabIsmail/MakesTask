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
//        [[self contentView] setBackgroundColor:[UIColor clearColor]];
//        [[self backgroundView] setBackgroundColor:[UIColor clearColor]];
//        [self setBackgroundColor:[UIColor clearColor]];

        
       _makeName.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        [_makeName.layer setCornerRadius:10.0f];
        [_makeName.layer setMasksToBounds:YES];
//        [_makeName.layer setBorderWidth:3.0f];
//        [_makeName.layer setBorderColor:[UIColor lightGrayColor].CGColor];

        [self.layer setCornerRadius:20.0f];
        [self.layer setMasksToBounds:YES];
        [self.layer setBorderWidth:3.0f];
        [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    }
    return self;
}

- (UILabel*) makeName {
    if(!_makeName){
        _makeName = [[UILabel alloc]init];
        [_makeName setTextAlignment:NSTextAlignmentCenter];
        [_makeName setTextColor:[UIColor darkGrayColor]];
        [_makeName setFont:[UIFont boldSystemFontOfSize:15]];
        [_makeName setText:@"Default"];
        
    }
    return _makeName;
}
@end
