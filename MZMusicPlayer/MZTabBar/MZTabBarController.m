//
//  MZTabBarController.m
//  MZMusicPlayer
//
//  Created by 孟令宗 on 2020/8/2.
//  Copyright © 2020 孟令宗. All rights reserved.
//

#import "MZTabBarController.h"
#import "MZHomeViewController.h"
#import "MZMusicPlayer-Swift.h"

@interface MZTabBarController ()

@end

@implementation MZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    MZHomeViewController *item = [[MZHomeViewController alloc]init];
       [self controller:item title:@"推荐" image:@"icon_tab_shouye_normal" selectedimage:@"icon_tab_shouye_highlight"];
    
    MZCategoryViewController *item0 = [[MZCategoryViewController alloc]init];
    [self controller:item0 title:@"分类" image:@"tab_icon_selection_normal" selectedimage:@"tab_icon_selection_highlight"];
        
    MZMineViewController *item2 = [[MZMineViewController alloc]init];
    [self controller:item2 title:@"我的" image:@"icon_tab_wode_normal" selectedimage:@"icon_tab_wode_highlight"];
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
    //设置tabbar的颜色
    self.tabBar.barTintColor = [UIColor whiteColor];
    //设置tabbaritem被选中时的颜色
    self.tabBar.tintColor = [UIColor colorWithRed:252/255.0 green:74/255.0 blue:132/255.0 alpha:0.9];
    [self setSelectedIndex:0];
}

-(void)controller:(UIViewController *)TS title:(NSString *)title image:(NSString *)image selectedimage:(NSString *)selectedimage{
    
    TS.tabBarItem.title = title;
    if ([image  isEqual: @""]) {
        
    }else{
        TS.tabBarItem.image = [UIImage imageNamed:image];
        TS.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }

    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:TS];
    [self addChildViewController:nav];
}

@end
