//
//  MZNetManager.h
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/2.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZNetManager : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void(^)(id responseObject, NSError *error))completed;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void(^)(id responseObject, NSError *error))completed;

@end

NS_ASSUME_NONNULL_END
