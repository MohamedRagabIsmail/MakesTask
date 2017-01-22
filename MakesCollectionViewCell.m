//
//  MakesCollectionViewCell.m
//  Makes
//
//  Created by Mohamed Ragab on 1/9/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import "MakesCollectionViewCell.h"
#import "Masonry.h"

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
        
        _makeName.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    }
    return self;
}

- (UILabel*) makeName {
    if(!_makeName){
        _makeName = [[UILabel alloc]init];
        [_makeName setTextAlignment:NSTextAlignmentCenter];
        [_makeName setTextColor:[UIColor whiteColor]];
        [_makeName setFont:[UIFont boldSystemFontOfSize:15]];
        [_makeName setText:@"Default"];
        
    }
    return _makeName;
}
@end
