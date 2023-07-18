//
//  MyTableViewCell.m
//  ZARA
//
//  Created by 夏楠 on 2023/5/31.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:@"touxiangCell"];
    if ([self.reuseIdentifier isEqualToString:@"touxiangCell"]) {
        self.headSculpture = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headSculpture];
        
        self.Name = [[UILabel alloc] init];
        [self.contentView addSubview:self.Name];
        
        self.wechatNumber = [[UILabel alloc] init];
        [self.contentView addSubview:self.wechatNumber];
        
        self.btn1 = [[UIButton alloc] init];
        self.btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentView addSubview:self.btn1];
        
        self.btn2 = [[UIButton alloc] init];
        [self.contentView addSubview:self.btn2];
        
        self.QRcode = [[UIImageView alloc] init];
        [self.contentView addSubview:self.QRcode];
        
        self.btn3 = [[UIButton alloc] init];
        [self.contentView addSubview:self.btn3];
    }
    return  self;
}

- (void)layoutSubviews {
    self.headSculpture.frame = CGRectMake(20, 30, 70, 70);
    
    self.Name.frame = CGRectMake(105, 30 + 5, 20, 20);
    
    self.wechatNumber.frame = CGRectMake(105, 80, 200, 15);
    
    self.QRcode.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 65, 68 , 15, 15);
    
    self.btn1.frame = CGRectMake(105, 110, 50, 15);
    
    self.btn2.frame = CGRectMake(20 + 50, 30 + 5 + 10 + 10 + 40, 30, 15);
   
    //=======
//    设置头像为圆形
//    self.headSculpture.layer.cornerRadius = self.headSculpture.frame.size.width / 2;
//    self.headSculpture.layer.masksToBounds = YES;
    //=================
    
    //================
    //将头像设置为圆角形
    CGFloat cornerRadius = 10.0; // 设置圆角半径

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.headSculpture.bounds
                                               byRoundingCorners:UIRectCornerAllCorners
                                                     cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.headSculpture.layer.mask = shapeLayer;
    //========================
    
    self.headSculpture.clipsToBounds = YES; // 确保视图剪裁到圆角边界
}

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.headSculpture = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)]; // 根据需要设置头像的位置和大小
//    self.headSculpture.contentMode = UIViewContentModeScaleAspectFill;
//    self.headSculpture.layer.cornerRadius = self.headSculpture.frame.size.width / 2; // 将头像设置为圆形
//    self.headSculpture.layer.masksToBounds = YES; // 将超出边界的部分裁剪掉
//
//    // 添加头像 UIImageView 到单元格的内容视图
//    [self.contentView addSubview:self.headSculpture];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
