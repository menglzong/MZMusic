//
//  MZDetailListViewController.h
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/9.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZDetailListViewController : UIViewController

- (instancetype)initWithAlbumId:(NSInteger)albumId title:(NSString *)oTitle;

@property (nonatomic,assign) NSInteger albumId;
@property (nonatomic,strong) NSString *oTitle;

@end

NS_ASSUME_NONNULL_END
