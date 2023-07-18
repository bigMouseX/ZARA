//
//  MyTableViewCell.h
//  ZARA
//
//  Created by 夏楠 on 2023/5/31.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView *headSculpture;
@property(nonatomic, strong)UILabel *Name;
@property(nonatomic, strong)UILabel *wechatNumber;
@property(nonatomic, strong)UIButton *btn1;
@property(nonatomic, strong)UIButton *btn2;
@property(nonatomic, strong)UIImageView *QRcode;
@property(nonatomic, strong)UIButton *btn3;
@end

NS_ASSUME_NONNULL_END
