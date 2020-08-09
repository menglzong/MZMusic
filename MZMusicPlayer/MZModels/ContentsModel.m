//
//  ContentsModel.m
//  
//
//  Created by apple-jd33 on 15/11/18.
//  Copyright © 2015年 HansRove. All rights reserved.
//

#import "ContentsModel.h"

@implementation ContentsModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"tags" : [ContentTags class], @"focusImages" : [ContentFocusimages class], @"categoryContents" : [ContentCategorycontents class]};
}

@end

@implementation ContentFocusimages

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : [CFocusimages_List class]};
}

@end


@implementation CFocusimages_List

@end


@implementation ContentTags

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : [ContentTags_List class]};
}

@end


@implementation ContentTags_List

@end


@implementation ContentCategorycontents

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : [CCategoryCotents_List class]};
}

@end


@implementation CCategoryCotents_List

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : [CCategoryCotents_L_List class]};
}

@end


@implementation CCategoryCotents_L_List

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"firstKResults" : [CC_L_L_Firstkresults class]};
}

@end


@implementation CC_L_L_Firstkresults

@end


