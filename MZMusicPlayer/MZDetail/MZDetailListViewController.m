//
//  MZDetailListViewController.m
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/9.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import "MZDetailListViewController.h"
#import "MZDetailViewModel.h"
#import "MZHomeTableViewCell.h"
#import <MJRefresh/MJRefresh.h>
#import <Masonry/Masonry.h>
#import <UIImageView+WebCache.h>
#import "MZDetailListCell.h"
#import "MZDetailViewModel.h"

@interface MZDetailListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MZDetailViewModel *tracksVM;


// 升序降序标签: 默认升序
@property (nonatomic,assign) BOOL isAsc;
@end

@implementation MZDetailListViewController{
    CGFloat _viewY;
}

- (instancetype)initWithAlbumId:(NSInteger)albumId title:(NSString *)oTitle {
    if (self = [super init]) {
        _albumId = albumId;
        _oTitle = oTitle;
    }
    return self;
}

#pragma mark - 入出 设置
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = _oTitle;
    [self.tracksVM getDataCompletionHandle:^(NSError * _Nonnull error) {
        if (error == nil) {
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - tableView懒加载
- (MZDetailViewModel *)tracksVM {
    if (!_tracksVM) {
        _tracksVM = [[MZDetailViewModel alloc] initWithAlbumId:_albumId title:_oTitle isAsc:!_isAsc];
    }
    return _tracksVM;
}

- (UITableView *)tableView {
    if (!_tableView) {
        // iOS7的状态栏（status bar）不再占用单独的20px, 所以要设置往下20px
        CGRect frame = self.view.bounds;
        //frame.origin.y += 20;
        // 设置普通模式
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MZDetailListCell class] forCellReuseIdentifier:@"MusicDetailCell"];
        _tableView.rowHeight = 80;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

#pragma mark - AlbumHeaderView代理方法

- (void)topLeftButtonDidClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)topRightButtonDidClick {
    NSLog(@"右边按钮点击");
}

#pragma mark - UITableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracksVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MZDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicDetailCell"];
    [cell.coverIV sd_setImageWithURL:[self.tracksVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"album_cover_bg"]];

    cell.titleLb.text = [self.tracksVM titleForRow:indexPath.row];
    cell.sourceLb.text = [self.tracksVM nickNameForRow:indexPath.row];
    cell.updateTimeLb.text = [self.tracksVM updateTimeForRow:indexPath.row];
    cell.playCountLb.text = [self.tracksVM playsCountForRow:indexPath.row];
    cell.durationLb.text = [self.tracksVM playTimeForRow:indexPath.row];
    cell.favorCountLb.text = [self.tracksVM favorCountForRow:indexPath.row];
    cell.commentCountLb.text = [self.tracksVM commentCountForRow:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

// 点击行数  实现听歌功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 当前播放信息
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[@"coverURL"] = [self.tracksVM coverURLForRow:indexPath.row];
    userInfo[@"musicURL"] = [self.tracksVM playURLForRow:indexPath.row];
    //有些地址不能正确显示图片，搞不懂
    //NSLog(@"%@",[self.tracksVM coverURLForRow:indexPath.row]);
    
    //位置
//    if (_viewY < -s_WindowW*0.56) {
//        CGFloat origin = 190 + indexPath.row*80 - (254 + _viewY);
//        NSNumber *originy = [[NSNumber alloc]initWithFloat:origin];
//        userInfo[@"originy"] = originy;
//    }else{
//        CGFloat origin = 190 + indexPath.row*80 - (234 + _viewY);
//        NSNumber *originy = [[NSNumber alloc]initWithFloat:origin];
//        userInfo[@"originy"] = originy;
//    }

    
//    NSInteger indexPathRow = indexPath.row;
//    NSNumber *indexPathRown = [[NSNumber alloc]initWithInteger:indexPathRow];
//    userInfo[@"indexPathRow"] = indexPathRown;
//
//    //专辑
//    userInfo[@"theSong"] = _tracksVM;
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeginPlay" object:nil userInfo:[userInfo copy]];
}

- (void)dealloc {
    NSLog(@"song dealloc");
}

@end
