//
//  Select.m
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "SelectViewController.h"
#import "Select_kid.h"
#import "Select_man.h"
#import "Select_woman.h"
@interface SelectViewController ()

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemSearch tag:101];
    self.tabBarItem = tabBarItem;
    self.navigationItem.title = @"Select";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
     
    //自定义初始界面背景图片
//    UIImage *customImage = [UIImage imageNamed:@"ZaraLogo1.png"];
//    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    backgroundImageView.image = customImage;
//    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
//    backgroundImageView.clipsToBounds = YES;
//    [self.view addSubview:backgroundImageView];

    
////  实现导航栏按钮的滚动
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.navigationController.navigationBar.frame.size.height)];
//    scrollView.showsHorizontalScrollIndicator = NO; // 可根据需要隐藏水平滚动指示器
//    scrollView.backgroundColor = [UIColor clearColor]; // 根据需要设置背景颜色
//    scrollView.scrollEnabled = YES;
//
//    CGFloat buttonWidth = 100; // 按钮的宽度
//    CGFloat buttonHeight = self.navigationController.navigationBar.frame.size.height; // 按钮的高度
//    // 循环创建和添加按钮到滚动视图
//    for (NSInteger i = 0; i < 3; i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(i * buttonWidth + (i * 100), 0, buttonWidth, buttonHeight);
//        if (i == 0) {
//            [button setTitle:@"女士" forState:UIControlStateNormal];
//            [button addTarget:self action:@selector(toWoman) forControlEvents:UIControlEventTouchUpInside];
//        }
//        if (i == 1) {
//            [button setTitle:@"男士" forState:UIControlStateNormal];
//            [button addTarget:self action:@selector(toMan) forControlEvents:UIControlEventTouchUpInside];
//        }
//        if (i == 2) {
//            [button setTitle:@"儿童" forState:UIControlStateNormal];
//            [button addTarget:self action:@selector(toKid) forControlEvents:UIControlEventTouchUpInside];
//        }
//        [scrollView addSubview:button];
//    }
//
//    // 设置滚动视图的内容大小
//    scrollView.contentSize = CGSizeMake(3 * buttonWidth + 200, buttonHeight);
//    self.navigationItem.titleView = scrollView;
    
    _segControl = [[UISegmentedControl alloc] init];
    _segControl.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.navigationController.navigationBar.frame.size.height);
    [_segControl insertSegmentWithTitle:@"男士" atIndex:0 animated:NO];
    [_segControl insertSegmentWithTitle:@"儿童" atIndex:0 animated:NO];
    [_segControl insertSegmentWithTitle:@"女士" atIndex:0 animated:NO];
    [_segControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    _segControl.selectedSegmentIndex = 0;
    //调整字体颜色
    NSDictionary *normalAttributes = @{
        NSForegroundColorAttributeName: [UIColor whiteColor], // 默认状态下的字体颜色
        NSFontAttributeName: [UIFont systemFontOfSize:16] // 默认状态下的字体大小
    };
    [_segControl setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];

    // 设置选中状态下的标题文本属性
    NSDictionary *selectedAttributes = @{
        NSForegroundColorAttributeName: [UIColor redColor], // 选中状态下的字体颜色
        NSFontAttributeName: [UIFont boldSystemFontOfSize:16] // 选中状态下的字体大小
    };
    [_segControl setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];

//-------------------------
    // 添加到视图中
    [self.view addSubview:_segControl];
    self.navigationItem.titleView = _segControl;
    
    //-----------------------
    self.sv = [[UIScrollView alloc] init];
    self.sv.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height - self.navigationController.navigationBar.frame.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.frame.size.height);
    
    //是否按照整页来滚动
    self.sv.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.sv.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    //高增大会增大纵向滚动条
    self.sv.bounces = YES;
    //开启横向弹动效果
    self.sv.alwaysBounceHorizontal = YES;
    //开启纵向弹动效果
    //一般会开启，但是对于滚动的只有图片不需要刷新的最好不要开启
//    sv.alwaysBounceVertical = YES;
    //显示横向滚动条
//    sv.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    //必须要画布大小大于滚动视图框架大小才能显示
    self.sv.showsVerticalScrollIndicator = YES;
    //要使不能纵向滑动，就要是高小于视图的高
    self.sv.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.frame.size.height - 175);
    self.sv.backgroundColor = [UIColor blackColor];
    
    for (int i = 0; i < 3; i++) {
        NSString *strName = [NSString stringWithFormat:@"S%d.jpg", i+1];

        // 创建图片
        UIImage *image = [UIImage imageNamed:strName];
        // 创建视图
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];

        // sv.frame一般要与iview.frame的图像尺寸相等
        //记得我们的[UIScreen mainScreen].bounds.size.width * (i + 1)一定要有(i + 1),这里稍微思考即可，在博客中会有总结
            iView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * i, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.frame.size.height - 50);
        // 记得添加到滚动视图中而不是添加到主视图中
        [self.sv addSubview:iView];
    }
    [self.view addSubview:self.sv];
    
    self.sv.delegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl {
    // 获取当前选中的索引
    NSInteger selectedIndex = segmentedControl.selectedSegmentIndex;
    
    // 获取滚动视图
    UIScrollView *scrollView = self.sv;
    
    // 计算滚动视图的偏移量
    CGFloat offsetX = selectedIndex * scrollView.bounds.size.width;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    // 设置滚动视图的内容偏移量
    [scrollView setContentOffset:CGPointMake(offsetX, offsetY) animated:YES];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 获取滚动视图的水平偏移量
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    
    // 根据滚动视图的偏移量计算要切换的索引
    NSInteger selectedIndex = (double)(contentOffsetX / scrollView.frame.size.width + 0.5);
    
    // 获取到导航栏中的 UISegmentedControl
    UISegmentedControl *segmentedControl = (UISegmentedControl *)self.navigationItem.titleView;
    
    // 更新 UISegmentedControl 的索引
    if (selectedIndex != segmentedControl.selectedSegmentIndex) {
        segmentedControl.selectedSegmentIndex = selectedIndex;
    }
}




@end
