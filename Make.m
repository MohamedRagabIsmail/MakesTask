//
//  Make.m
//  Makes
//
//  Created by Mohamed Ragab on 1/8/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import "Make.h"

@implementation Make
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"makeID": @"ID",
             @"nameEn": @"NameEn",
             @"nameAr": @"NameAr",
             @"imageSmallURL": @"ImgSmall",
             @"imageLargeURL": @"ImgLarge"
             };
}

@end
