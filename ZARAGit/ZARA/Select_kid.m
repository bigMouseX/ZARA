//
//  Select_kid.m
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "Select_kid.h"

@interface Select_kid ()

@end

@implementation Select_kid

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //以自定义图片作为背景
    UIImage *customImage = [UIImage imageNamed:@"Select_kid.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundImageView.image = customImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.clipsToBounds = YES;
    [self.view addSubview:backgroundImageView];
    
    self.scrollView = [[UIScrollView alloc] init];;
    self.scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 1.5);
    self.scrollView.scrollEnabled = YES;
    
    
    //选项
    UIButton *btn1_kid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_kid setTitle:@"男婴" forState:UIControlStateNormal];
    btn1_kid.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, [UIScreen mainScreen].bounds.size.height / 2 - 200 , 100, 100);
    btn1_kid.tintColor = [UIColor blackColor];
    [self.scrollView addSubview:btn1_kid];
    
    UIButton *btn2_kid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2_kid setTitle:@"男童" forState:UIControlStateNormal];
    btn2_kid.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, [UIScreen mainScreen].bounds.size.height / 2 , 100, 100);
    btn2_kid.tintColor = [UIColor blackColor];
    [self.scrollView addSubview:btn2_kid];
    
    UIButton *btn3_kid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3_kid setTitle:@"女婴" forState:UIControlStateNormal];
    btn3_kid.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, [UIScreen mainScreen].bounds.size.height / 2 + 200 , 100, 100);
    btn3_kid.tintColor = [UIColor blackColor];
    [self.scrollView addSubview:btn3_kid];
    
    UIButton *btn4_kid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4_kid setTitle:@"女婴" forState:UIControlStateNormal];
    btn4_kid.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, [UIScreen mainScreen].bounds.size.height / 2 + 400, 100, 100);
    btn4_kid.tintColor = [UIColor blackColor];
    [self.scrollView addSubview:btn4_kid];
    //-----------------------------
    [self.view addSubview:self.scrollView];
    
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
