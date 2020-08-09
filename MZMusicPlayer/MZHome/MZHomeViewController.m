//
//  MZHomeViewController.m
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/2.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import "MZHomeViewController.h"
#import "MZHomeModel.h"
#import "MZHomeTableViewCell.h"
#import <AFNetworking/UIButton+AFNetworking.h>

@interface MZHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MZHomeModel *homeViewModel;

@end

@implementation MZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐";
    [self.view addSubview:self.tableView];
    [self.homeViewModel getDataCompletionHandle:^(NSError * _Nonnull error) {
        if (error == nil) {
            [self.tableView reloadData];
        }
    }];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.homeViewModel.sectionNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.homeViewModel rowForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *cellID = @"TCell101";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        cell.imageView.image = [UIImage imageNamed:@"music_tuijian"];
        cell.textLabel.text = [self.homeViewModel titleForIndexPath:indexPath];
        cell.detailTextLabel.text = [self.homeViewModel subTitleForIndexPath:indexPath];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    } else {
        MZHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        [cell.coverBtn setImageForState:UIControlStateNormal withURL:[self.homeViewModel coverURLForIndexPath:indexPath] placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
        cell.titleLb.text = [self.homeViewModel titleForIndexPath:indexPath];
        cell.introLb.text = [self.homeViewModel subTitleForIndexPath:indexPath];
        cell.playsLb.text = [self.homeViewModel playsForIndexPath:indexPath];
        cell.tracksLb.text = [self.homeViewModel tracksForIndexPath:indexPath];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

// 组头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return !section ? 0: 35;
}

// 组尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MZHomeTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (MZHomeModel *)homeViewModel {
    if (_homeViewModel == nil) {
        _homeViewModel = [[MZHomeModel alloc] initWithCategoryId:2 contentType:@"album"];
    }
    return _homeViewModel;
}

@end
