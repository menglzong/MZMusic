//
//  MZCategoryDetailViewController.m
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/9.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import "MZCategoryDetailViewController.h"
#import "MZCategoryViewModel.h"
#import "MZHomeTableViewCell.h"
#import <MJRefresh/MJRefresh.h>
#import <Masonry/Masonry.h>
#import <UIButton+AFNetworking.h>
#import "MZDetailListViewController.h"

@interface MZCategoryDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MZCategoryViewModel *categoryVM;

@end

@implementation MZCategoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 启动开启上拉刷新
    [self.tableView.mj_header beginRefreshing];
    // 上拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.categoryVM refreshDataCompletionHandle:^(NSError *error) {
            [self setFooter];
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.categoryVM refreshDataCompletionHandle:^(NSError *error) {
        [self setFooter];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    }];
    self.hidesBottomBarWhenPushed = YES;//隐藏 tabBar 在navigationController结构中
}

#pragma mark - 入出 设置
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.navigationController.navigationBar = nil;
    
    [self setupNav];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    self.hidesBottomBarWhenPushed = YES;//隐藏 tabBar 在navigationController结构中
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)setupNav{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.title = self.keyName;
}

#pragma mark - UITableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.categoryVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MZHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MCCell"];
    
    [cell.coverBtn setImageForState:UIControlStateNormal withURL:[self.categoryVM coverURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
    
    cell.titleLb.text = [self.categoryVM titleForRow:indexPath.row];
    cell.introLb.text = [self.categoryVM introForRow:indexPath.row];
    cell.playsLb.text = [self.categoryVM playsForRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 从本控制器VM获取头标题, 以及分类ID回初始化
    MZDetailListViewController *vc = [[MZDetailListViewController alloc] initWithAlbumId:[self.categoryVM albumIdForRow:indexPath.row] title:[self.categoryVM titleForRow:indexPath.row]];

    self.hidesBottomBarWhenPushed = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - VM,tableView懒加载
- (MZCategoryViewModel *)categoryVM {
    if (!_categoryVM) {
        // 通过categoryID name创建网络解析
        _categoryVM = [[MZCategoryViewModel alloc] initWithCategoryId:2 tagName:self.keyName];
    }
    return _categoryVM;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[MZHomeTableViewCell class] forCellReuseIdentifier:@"MCCell"];
        _tableView.rowHeight = 70;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
/** 设置下拉 */
- (void)setFooter{

    if (self.categoryVM.rowNumber < 20) {

    }else{
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.categoryVM getMoreDataCompletionHandle:^(NSError *error) {
                [self.tableView.mj_footer endRefreshing];
                [self changeFooter];
                [self.tableView reloadData];
            }];
        }];
    }
}
/** 到底取消下拉刷新 */
- (void)changeFooter{

    if (self.categoryVM.rowNumber % 10) {
        _tableView.mj_footer = nil;
    }
}

@end
