//
//  Make.h
//  Makes
//
//  Created by Mohamed Ragab on 1/8/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Make : MTLModel <MTLJSONSerializing>
@property (nonatomic) NSNumber *makeID;
@property (nonatomic) NSString *nameEn;
@property (nonatomic) NSString *nameAr;
@property (nonatomic) NSString *imageSmallURL;
@property (nonatomic) NSString *imageLargeURL;
@end
