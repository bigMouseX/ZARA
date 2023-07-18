//
//  Home.m
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *logoView = [[UIImageView alloc] init];
    logoView.frame = CGRectMake(-50, 0, 350, 200);
    UIImage *logo = [UIImage imageNamed:@"ZaraLogo.png"];
    logoView.image = logo;
    [self.view addSubview:logoView];
    
    UIButton *Sousuo = [UIButton buttonWithType:UIButtonTypeCustom];
    Sousuo.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 40, 75, 30, 30);
    UIImage *icon1 = [UIImage imageNamed:@"sousuo.png"];
    [Sousuo setImage:icon1 forState:UIControlStateNormal];
    [self.view addSubview:Sousuo];
    
    //-----------------------
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2  - 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 320);
    
    //是否按照整页来滚动
    self.scrollView.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.scrollView.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大雨Frame的大小
    //通过足够大的画布来承受足够多的图片
    
    //高增大会增大纵向滚动条
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 5, [UIScreen mainScreen].bounds.size.height / 2);
//    sv.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height / 2);
   
    //是否可以边缘弹动效果
    //这个是比较有用的点，可以让我们第一张与最后一张图片只能向前或向后拉动，而不能向没有图片的方向拉动
    //bounces的意思是弹动
    self.scrollView.bounces = YES;
    //开启横向弹动效果
    self.scrollView.alwaysBounceHorizontal = YES;
    //开启纵向弹动效果
    //一般会开启，但是对于滚动的只有图片不需要刷新的最好不要开启
//    sv.alwaysBounceVertical = YES;
    //显示横向滚动条
//    sv.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    //必须要画布大小大于滚动视图框架大小才能显示
    self.scrollView.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView.backgroundColor = [UIColor blackColor];

    for (int i = 0; i <= 5; i++) {
        NSString *strName = [NSString stringWithFormat:@"P%d.png", (i % 3) + 1];

        // 创建图片
        UIImage *image = [UIImage imageNamed:strName];
        // 创建视图
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];

        // sv.frame一般要与iview.frame的图像尺寸相等
        //记得我们的[UIScreen mainScreen].bounds.size.width * (i + 1)一定要有(i + 1),这里稍微思考即可，在博客中会有总结
        //这里之所以要i==5是因为我们在画布为0的位置没有赋值
        if (i == 5) {
            iView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 300);
        }
        else {
            iView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * (i + 1), 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 320);
        }
        // 记得添加到滚动视图中而不是添加到主视图中
        [self.scrollView addSubview:iView];
    }

    
    
    [self.view addSubview:self.scrollView];

    // 设置初始偏移量到第二张图片
    [self.scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:NO];

    // 实现滚动到最后一张视图时，再次滚动能回到第一张视图
    self.scrollView.delegate = self;
    //--------------------
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    left.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2 + 30, 20, 20);
    UIImage *iconLeft = [UIImage imageNamed:@"fanhui.png"];
    [left setImage:iconLeft forState:UIControlStateNormal];
    [left addTarget:self action:@selector(pressLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:left];
    
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height / 2 + 30, 20, 20);
    UIImage *iconRight = [UIImage imageNamed:@"qianjin.png"];
    [right setImage:iconRight forState:UIControlStateNormal];
    [right addTarget:self action:@selector(pressRight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:right];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //当前滚动到的x位置
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat screenWidth = CGRectGetWidth(scrollView.frame);
    CGFloat contentWidth = scrollView.contentSize.width;

    // 滚动到最后一张视图之后，将滚动位置重置到第二张图片
    if (contentOffsetX >= contentWidth - screenWidth) {
        [scrollView setContentOffset:CGPointMake(screenWidth, 0) animated:NO];
    }
    // 滚动到第一张视图之前，将滚动位置重置到倒数第二张图片
    else if (contentOffsetX < screenWidth - scrollView.frame.size.width) {
        [scrollView setContentOffset:CGPointMake(contentWidth - 2 * screenWidth, 0) animated:NO];
    }
}

- (void)pressLeft {
    CGFloat contentOffsetX = self.scrollView.contentOffset.x;
    CGFloat screenWidth = CGRectGetWidth(self.scrollView.frame);
//    CGFloat contentWidth = self.scrollView.contentSize.width;
    [self.scrollView setContentOffset:CGPointMake(contentOffsetX - screenWidth, 0) animated:YES];
}

- (void)pressRight {
    CGFloat contentOffsetX = self.scrollView.contentOffset.x;
    CGFloat screenWidth = CGRectGetWidth(self.scrollView.frame);
//    CGFloat contentWidth = self.scrollView.contentSize.width;
    [self.scrollView setContentOffset:CGPointMake(contentOffsetX + screenWidth, 0) animated:YES];

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
