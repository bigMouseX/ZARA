//
//  SceneDelegate.m
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "SceneDelegate.h"
#import "HomeViewController.h"
#import "SelectViewController.h"
#import "BuyViewController.h"
#import "AdminViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    //创建选项卡
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    UIImage *Shouye = [UIImage imageNamed:@"zhuye.png"];
//    这个方法就是用来设置图片的渲染模式的  UIImageRenderingModeAlwaysOriginal这个枚举值是声明这张图片要按照原来的样子显示，不需要渲染成其他颜色,redeeringMode：渲染
    Shouye = [Shouye imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.tabBarItem.image = Shouye;
    vc1.tabBarItem.title = @"主页";
    vc1.view.backgroundColor = [UIColor  blackColor];

    
    SelectViewController *vc2 = [[SelectViewController alloc] init];
    UINavigationController *vc2Navigation = [[UINavigationController alloc] initWithRootViewController:vc2];
//    vc2.view.backgroundColor = [UIColor grayColor];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemSearch tag:101];
    vc2.tabBarItem = tabBarItem;
    vc2.navigationItem.title = @"Select";
    [vc2.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    
    BuyViewController *vc3 = [[BuyViewController alloc] init];
    UIImage *Gouwuche = [UIImage imageNamed:@"gouwuche.png"];
    Gouwuche = [Gouwuche imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc3.tabBarItem.image = Gouwuche;
    vc3.tabBarItem.title = @"购物";
    vc3.view.backgroundColor = [UIColor grayColor];
    
    AdminViewController *vc4 = [[AdminViewController alloc] init];
    UIImage *Yonghu = [UIImage imageNamed:@"yonghu.png"];
    Yonghu = [Yonghu imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc4.tabBarItem.image = Yonghu;
    vc4.tabBarItem.title = @"我";
    UINavigationController *vc4Navigation = [[UINavigationController alloc] initWithRootViewController:vc4];
    vc4.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[vc1, vc2Navigation, vc3, vc4Navigation];
    tabBarController.selectedIndex = 0;
    
    //导航栏设为透明
    tabBarController.tabBar.backgroundColor = [UIColor clearColor];
    
    self.window.rootViewController = tabBarController;
}

//开始编辑前调用
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    NSLog(@"即将开始前");
}

//即将结束前
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed {
    NSLog(@"即将结束前");
}

//已经结束编辑
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed {
    NSLog(@"vcs == %@", viewControllers);
    if(changed == YES) {
        NSLog(@"顺序发生改变");
    }
    
    NSLog(@"已经结束编辑");
}

//选中控制器
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    //可以获得索引
    if (tabBarController.viewControllers[tabBarController.selectedIndex] == viewController) {
        NSLog(@"1");
    }
    NSLog(@"选中控制器");
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
