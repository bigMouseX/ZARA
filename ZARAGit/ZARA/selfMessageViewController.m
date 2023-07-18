//
//  selfMessageViewController.m
//  ZARA
//
//  Created by 夏楠 on 2023/6/4.
//

#import "selfMessageViewController.h"
#import "selfMessageTableViewCell.h"
@interface selfMessageViewController ()
@property (nonatomic, strong) UIImage *headImage;
@end

@implementation selfMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    UIColor *wechatBackgroundColor = [UIColor colorWithRed:(CGFloat)0xF7/255.0 green:(CGFloat)0xF7/255.0 blue:(CGFloat)0xF7/255.0 alpha:1.0];
    self.view.backgroundColor = wechatBackgroundColor;
    self.headImage = [UIImage imageNamed:@"hs.jpeg"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = wechatBackgroundColor;
    [self.tableView registerClass:[selfMessageTableViewCell class] forCellReuseIdentifier:@"selfMessage"];
    [self.view addSubview:self.tableView];
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    selfMessageTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"selfMessage"];
    cell.backgroundColor = [UIColor whiteColor];
        if (indexPath.row == 0) {
            cell.message1.text = @"头像";
//            UIImage *head = [UIImage imageNamed:@"hs.jpeg"];
            cell.head.image = self.headImage;
            cell.backgroundColor = [UIColor whiteColor];
            
            CALayer *separatorLayer = [CALayer layer];
            separatorLayer.frame = CGRectMake(50, 80, self.view.frame.size.width, 1);
            UIColor *separatorColor = [UIColor colorWithWhite:0.9 alpha:1.0];
            separatorLayer.backgroundColor = separatorColor.CGColor;
            [cell.layer addSublayer:separatorLayer];
//
////            -----------换头像操作---
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//
//            cell.userInteractionEnabled = YES;
//                //初始化一个手势
//            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self
//                                                                        action:@selector(alterHeadPortrait:)];
//                //给ImageView添加手势
//            [cell addGestureRecognizer:singleTap];
//
////            -----------------------
            
            return cell;
        }
        else if (indexPath.row == 1) {
            cell.message1.text = @"名字";
            cell.message2.text = @"x.";
            cell.backgroundColor = [UIColor whiteColor];
            
            CALayer *separatorLayer = [CALayer layer];
            separatorLayer.frame = CGRectMake(50, 80, self.view.frame.size.width, 1);
            UIColor *separatorColor = [UIColor colorWithWhite:0.9 alpha:1.0];
            separatorLayer.backgroundColor = separatorColor.CGColor;
            [cell.layer addSublayer:separatorLayer];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            return cell;
        }
        else {
            cell.message1.text = @"微信号";
            cell.message2.text = @"111";
            cell.backgroundColor = [UIColor whiteColor];
            
            CALayer *separatorLayer = [CALayer layer];
            separatorLayer.frame = CGRectMake(50, 80, self.view.frame.size.width, 1);
            UIColor *separatorColor = [UIColor colorWithWhite:0.9 alpha:1.0];
            separatorLayer.backgroundColor = separatorColor.CGColor;
            [cell.layer addSublayer:separatorLayer];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

            return cell;
        }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

//同一个section中的cell具有不同的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 80;
    } else {
        return 80;
    }
}

////--------------去除顶部间隔，保留底部间隔----------
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *headerView = [[UIView alloc] init];
//    headerView.backgroundColor = [UIColor clearColor];
//    return headerView;
//}
//
////脚视图高度
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 10;
//}
//
////要设置底部间隔，就必须有这个操作
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *footerView = [[UIView alloc] init];
//    footerView.backgroundColor = [UIColor clearColor];
//    return footerView;
//}
////-------------------------------

- (void)pressSelf {
    selfMessageViewController *selfMessage = [[selfMessageViewController alloc] init];
    
    [self.navigationController pushViewController:selfMessage animated:YES];
}

- (void)alterHeadPortrait:(UITapGestureRecognizer *)gesture {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *chooseFromAlbumAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 从相册选择照片
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;// // 设置图片来源为相册
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    [alert addAction:chooseFromAlbumAction];

    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 拍摄照片
        // 检查设备是否支持拍摄功能
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;// 如果支持，则设置图片来源为相机
            imagePicker.delegate = self;
            [self presentViewController:imagePicker animated:YES completion:nil];
        } else {
            // 相机不可用的处理逻辑
        }
    }];
    [alert addAction:takePhotoAction];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];

    [self presentViewController:alert animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    // 根据选择的照片更新头像显示
    // ..
    self.headImage = selectedImage;
    [self.tableView reloadData];

    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
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
