//
//  MakesManager.h
//  Makes
//
//  Created by Mohamed Ragab on 1/17/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface MakesManager : AFHTTPSessionManager
- (void)makesWithsuccess:(void (^)(NSArray *makes))success
                 failure:(void (^)(NSError *error))failure;

@end
