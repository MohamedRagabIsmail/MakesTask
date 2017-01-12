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
//        _makeImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
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
        
        UIEdgeInsets padding = UIEdgeInsetsMake(10 + self.contentView.bounds.size.height*0.5f, 10, 10, 10);
        
        [self.makeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(padding);
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
