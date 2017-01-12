//
//  Make.h
//  Makes
//
//  Created by Mohamed Ragab on 1/8/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Make : MTLModel <MTLJSONSerializing>
@property (nonatomic,retain) NSNumber* makeID;
@property (nonatomic,retain) NSString* nameEn;
@property (nonatomic,retain) NSString* nameAr;
@property (nonatomic,retain) NSNumber* modelsCount;
@property (nonatomic,retain) NSNumber* enginesCount;
@property (nonatomic,retain) NSString* imageSmallURL;
@property (nonatomic,retain) NSString* imageLargeURL;
@end
