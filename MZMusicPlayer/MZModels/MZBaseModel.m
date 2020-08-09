//
//  MZBaseModel.m
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/2.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import "MZBaseModel.h"


@implementation MZBaseModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}
@end
