//
//  Select_woman.m
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "Select_woman.h"
@interface Select_woman ()

@end

@implementation Select_woman

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //以自定义图片作为背景
    UIImage *customImage = [UIImage imageNamed:@"Select_woman.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundImageView.image = customImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.clipsToBounds = YES;
    [self.view addSubview:backgroundImageView];

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
