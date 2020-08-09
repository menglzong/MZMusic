//
//  MZHomeViewController.m
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/2.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import "MZHomeViewController.h"

@interface MZHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐";
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

// 组头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (tableView.tag == 100) {
        if (section == 0) {
            return 40;
        }else
        return 0.0001;
    }else if(tableView.tag == 101){
         return !section ? 0: 35;
    }else{
        return 10;
    }
}

// 组尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (tableView.tag == 100) {
        return 0.0001;
    }else if(tableView.tag == 101){
        return 10;
    }else{
        return 10;
    }
    
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
