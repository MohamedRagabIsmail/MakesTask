//
//  MakesManager.m
//  Makes
//
//  Created by Mohamed Ragab on 1/17/17.
//  Copyright © 2017 Mohamed Ragab. All rights reserved.
//

#import "MakesManager.h"
#import "Make.h"
#import <Mantle/Mantle.h>

@implementation MakesManager

+ (instancetype)manager {
    MakesManager *makesManager = [[[self class] alloc] initWithBaseURL:[NSURL URLWithString:@"http://newapi.contactcars.com/"]];
    return makesManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

- (void)makesWithsuccess:(void (^)(NSArray *makes))success
                    failure:(void (^)(NSError *error))failure {
     //  NSString* endpoint = [self.baseURL.absoluteString stringByAppendingString:@"newcars/makes"];
    NSString *endPoint = @"newcars/makes";
    [self GET:endPoint parameters:nil progress:nil
      success:^(NSURLSessionDataTask *task, id responseObject) {
          NSError *error = nil;
          NSArray *makes = [MTLJSONAdapter modelsOfClass:[Make class] fromJSONArray:responseObject error:&error];
          
          success(makes);
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
          if (failure) {
              failure(error);
          }
      }];
}

@end
