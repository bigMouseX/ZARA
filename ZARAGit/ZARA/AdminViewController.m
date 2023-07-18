//
//  Admin.m
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "AdminViewController.h"
#import "selfMessageViewController.h"
@interface AdminViewController ()

@end

@implementation AdminViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //这三个是必须的
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    self.tableView.backgroundColor = wechatBackgroundColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    [self.view addSubview:self.tableView];
    
    _arrayData =@[@[@"服务"],
                  @[@"收藏", @"朋友圈", @"表情", @"卡包"],
                  @[@"设置"]];
    
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"touxiangCell"];
    [self.tableView registerClass:[serviceTableViewCell class] forCellReuseIdentifier:@"serviceCell"];

    //---------------------------
    //点击头像边框可以进入界面换头像
    UIButton *clearHead = [[UIButton alloc] init];
    clearHead.frame = CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 70);
    clearHead.backgroundColor = [UIColor clearColor];
    [clearHead addTarget:self action:@selector(pressSelf) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:clearHead];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //每个单元格有其固定的索引路径
    //尺寸在如果在viewcontroller与自定义cell中同时设置，先取自定义cell中的
    if (indexPath.section == 0) {
        MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"touxiangCell" forIndexPath:indexPath];
        UIImage *hs = [UIImage imageNamed:@"hs.jpeg"];
        cell.headSculpture.image = hs;
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        cell.imageView.clipsToBounds = YES;

        UIImage *QRcode = [UIImage imageNamed:@"erweima.png"];
        cell.QRcode.image = QRcode;

        cell.Name.text = @"X.";
        cell.Name.textColor = [UIColor blackColor];

        cell.wechatNumber.text = @"微信号:xianan941691727";
        cell.wechatNumber.font = [UIFont systemFontOfSize:16.0];
        cell.wechatNumber.textColor = [UIColor grayColor];
        
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    } else if (indexPath.section == 1) {
        serviceTableViewCell *cellA = [_tableView dequeueReusableCellWithIdentifier:@"serviceCell" forIndexPath:indexPath];
        //每次创建单元格的索引不同
        cellA.name.text = _arrayData[indexPath.section - 1][indexPath.row];
        cellA.name.textColor = [UIColor blackColor];
        
        NSString *t = [NSString stringWithFormat:@"set%ld.png", indexPath.row + 1];
        UIImage *image = [UIImage imageNamed:t];
        UIImage *roundedImage = [self roundedImageWithImage:image cornerRadius:image.size.width/2.0];
        cellA.icon.image = roundedImage;
        cellA.backgroundColor = [UIColor whiteColor];
        cellA.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cellA;
    }
    else if (indexPath.section == 2) {
        serviceTableViewCell *cellA = [_tableView dequeueReusableCellWithIdentifier:@"serviceCell" forIndexPath:indexPath];
        //每次创建单元格的索引不同
        cellA.name.text = _arrayData[indexPath.section - 1][indexPath.row];
        cellA.name.textColor = [UIColor blackColor];
        
        NSString *t = [NSString stringWithFormat:@"set%ld.png", indexPath.row + 2];
        UIImage *image = [UIImage imageNamed:t];
        UIImage *roundedImage = [self roundedImageWithImage:image cornerRadius:image.size.width/2.0];
        cellA.icon.image = image;
        cellA.backgroundColor = [UIColor whiteColor];
        cellA.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        //分割线
        CALayer *separatorLayer = [CALayer layer];
        separatorLayer.frame = CGRectMake(50, 60, self.view.frame.size.width, 1);
        UIColor *separatorColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        separatorLayer.backgroundColor = separatorColor.CGColor;
        [cellA.layer addSublayer:separatorLayer];

        return cellA;
    } else {
        serviceTableViewCell *cellA = [_tableView dequeueReusableCellWithIdentifier:@"serviceCell" forIndexPath:indexPath];
        //每次创建单元格的索引不同
        cellA.name.text = _arrayData[indexPath.section - 1][indexPath.row];
        cellA.name.textColor = [UIColor blackColor];
        NSString *t = [NSString stringWithFormat:@"set%ld%ld.png", indexPath.section, indexPath.row + 1];
        UIImage *image = [UIImage imageNamed:t];
        cellA.icon.image = image;
        cellA.backgroundColor = [UIColor whiteColor];
        cellA.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cellA;
    }
    return 0;
}

- (UIImage *)roundedImageWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, [UIScreen mainScreen].scale);
    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:cornerRadius];
    [path addClip];
    [image drawInRect:imageRect];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return roundedImage;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    }
    else if (section == 2) {
        return 4;
    } else {
        return 1;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 根据需要自定义不同行的高度
    if (indexPath.section == 0) {
        return 150; // 第一行的高度为150
    } else  {
        return 60; // 第二行的高度为60
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

//要设置底部间隔，就必须有这个操作 
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (void)pressSelf {
    selfMessageViewController *selfMessage = [[selfMessageViewController alloc] init];
    
    [self.navigationController pushViewController:selfMessage animated:YES];
}

-(void)unselectCell:(id)sender{
[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   //跳转等其他操作
  [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 0)];
//    spacerView.backgroundColor = [UIColor clearColor]; // 设置透明背景颜色
//    return spacerView;
//}




@end
