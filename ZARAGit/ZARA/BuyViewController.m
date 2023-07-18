//
//  Buy.m
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "BuyViewController.h"

@interface BuyViewController ()

@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"购物袋" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(0, 50, 100, 100);
    btn1.tintColor = [UIColor whiteColor];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"收藏夹" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(100, 50, 100, 100);
    btn2.tintColor = [UIColor whiteColor];
    
    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    self.view.backgroundColor = wechatBackgroundColor;
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
   
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
