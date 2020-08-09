//
//  MZBaseViewModel.h
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/9.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MZBaseViewModelDelegate <NSObject>

@optional
/** 获取更多 */
- (void)getMoreDataCompletionHandle:(void(^)(NSError *error))completed;
/** 刷新 */
- (void)refreshDataCompletionHandle:(void(^)(NSError *error))completed;
/** 获取数据 */
- (void)getDataCompletionHandle:(void(^)(NSError *error))completed;
/** 通过indexPath返回cell高*/
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath;

@end

@interface MZBaseViewModel : NSObject<MZBaseViewModelDelegate>

@property (nonatomic,strong) NSURLSessionDataTask *dataTask;
/**  取消任务 */
- (void)cancelTask;
/**  暂停任务 */
- (void)suspendTask;
/**  继续任务 */
- (void)resumeTask;

@end

NS_ASSUME_NONNULL_END
