//
//  MZHomeMoreCell.h
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/9.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Delegate传值
@protocol MZTitleViewDelegate <NSObject>

- (void)titleViewDidClick:(NSInteger)tag;

@end

@interface MZHomeMoreCell : UIView

// 添加代理
@property (nonatomic,weak) id<MZTitleViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title hasMore:(BOOL)more titleTag:(NSInteger) titleTag;

/**  标题 */
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UILabel *titleLb;

@property (nonatomic,assign) NSInteger titleTag;


@end

NS_ASSUME_NONNULL_END
