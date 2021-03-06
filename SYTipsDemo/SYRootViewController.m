//
//  SYRootViewController.m
//  SYTipsDemo
//
//  Created by Sauchye on 8/11/15.
//  Copyright (c) 2015 sauchye.com. All rights reserved.
//  https://github.com/sauchye/SYTipsDemo
//

#import "SYRootViewController.h"


@interface SYRootViewController ()

@end

@implementation SYRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
}

- (void)setupViewControllers{
    SYFirstViewController *firstVC = [[SYFirstViewController alloc] init];
    SYSecondViewController *secondVC = [[SYSecondViewController alloc] init];
    SYThirdViewController *thirdVC = [[SYThirdViewController alloc] init];
    firstVC.title = VString(@"Home");
    secondVC.title = VString(@"Found");
    thirdVC.title = VString(@"");
    self.firstNav = [[SYBaseNavigationController alloc] initWithRootViewController:firstVC];
    self.secondNav = [[SYBaseNavigationController alloc] initWithRootViewController:secondVC];
    self.thirdNav = [[SYBaseNavigationController alloc] initWithRootViewController:thirdVC];
    [self setViewControllers:@[self.firstNav, self.secondNav, self.thirdNav]];
    
    [self customizeTabBarForController];
}

- (void)customizeTabBarForController{
    
// icon https://github.com/Coding/Coding-iOS
    
    //tabbar 背景图片 tabbar_background
    UIImage *backgroundImage ;//= [UIImage imageNamed:@"tabbar_background"];
    //选项卡图片
    NSArray *tabBarItemImages = @[VString(@"home"), VString(@"activity"), VString(@"me")];
    
    NSArray *tabBarItemTitles = @[VString(@"Home"), VString(@"Found"), VString(@"Me")];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items])
    {
        item.titlePositionAdjustment = UIOffsetMake(0, 2.0);
        [item setBackgroundSelectedImage:backgroundImage withUnselectedImage:backgroundImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",[tabBarItemImages objectAtIndex:index]]];
        
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",[tabBarItemImages objectAtIndex:index]]];
        
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        item.selectedTitleAttributes = @{
                                         NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
                                         NSForegroundColorAttributeName:RGB(46, 52, 62),
                                         };
        item.unselectedTitleAttributes = @{
                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
                                           NSForegroundColorAttributeName:[UIColor grayColor],
                                           };
        
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        index++;
        
    }
}

#pragma mark - Orientations 竖屏
//- (BOOL)shouldAutorotate{
//    return NO;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
