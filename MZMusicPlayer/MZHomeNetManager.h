//
//  MZHomeNetManager.h
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/2.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZNetManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MZHomeNetManager : MZNetManager

/** 解析,获取内容推荐数据模型 */
// http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends?categoryId=1&contentType=album&device=android&scale=2&version=4.3.32.2
+ (id)getContentsForForCategoryId:(NSInteger)categoryID contentType:(NSString*)type completionHandle:(void(^)(id responseObject, NSError *error))completed;


/**  解析,内容分类数据模型*/
// 通过catotyId, tagName, 以及初始行数 pageSize
// http://mobile.ximalaya.com/mobile/discovery/v1/category/album?calcDimension=hot&categoryId=1&device=android&pageId=1&pageSize=20&status=0&tagName=%E6%AD%A3%E8%83%BD%E9%87%8F%E5%8A%A0%E6%B2%B9%E7%AB%99
+ (id)getCategoryForCategoryId:(NSInteger)categoryId tagName:(NSString *)name pageSize:(NSInteger)size completionHandle:(void(^)(id responseObject, NSError *error))completed;

/**  解析,小编推荐更多数据模型*/
// http://mobile.ximalaya.com/mobile/discovery/v1/recommend/editor?device=android&pageId=1&pageSize=20&title=%E6%9B%B4%E5%A4%9A
+ (id)getEditorMoreForPageSize:(NSInteger)size completionHandle:(void(^)(id responseObject, NSError *error))completed;

/**  解析,精品听单更多数据模型  加载更多通过page*/
// http://mobile.ximalaya.com/m/subject_list?device=android&page=1&per_page=10&title=%E6%9B%B4%E5%A4%9A
+ (id)getSpecialForPage:(NSInteger)page completionHandle:(void(^)(id responseObject, NSError *error))completed;

/**  从网络上获取 选集信息  通过AlbumId, mainTitle, idAsc(是否升序)*/
//http://mobile.ximalaya.com/mobile/others/ca/album/track/2758446/true/1/20?position=1&albumId=2758446&isAsc=true&device=android&title=%E5%B0%8F%E7%BC%96%E6%8E%A8%E8%8D%90&pageSize=20
+ (id)getTracksForAlbumId:(NSInteger)albumId mainTitle:(NSString *)title idAsc:(BOOL)isAsc completionHandle:(void(^)(id responseObject, NSError *error))completed;

@end

NS_ASSUME_NONNULL_END
