//
//  MZNetManager.m
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/2.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import "MZNetManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation MZNetManager

static AFHTTPSessionManager *manager = nil;

/** AFHTTPSessionManager单例 */
+ (AFHTTPSessionManager *)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        // 设置接受解析的内容类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"text/plain",@"text/javascript",@"application/json", nil];
    });
    return manager;
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void (^)(id, NSError *))completed {
    
    //NSLog(@"Request Path: %@, params %@", path, params);
    //NSString *urlStr = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [[self defaultManager] GET:path parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completed(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void (^)(id, NSError *))completed {
    return [[self defaultManager] POST:path parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completed(nil, error);
    }];
}

@end
