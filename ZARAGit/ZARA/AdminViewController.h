//
//  Admin.h
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "serviceTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
NS_ASSUME_NONNULL_BEGIN

@interface AdminViewController : ViewController<UITableViewDelegate,
UITableViewDataSource>

//不要忘记这个
@property UITableView* tableView;
@property(nonatomic, strong)MyTableViewCell *myCell;
@property(nonatomic, strong)serviceTableViewCell *serviceCell;
@property(nonatomic, strong)NSArray *arrayData;
@property(nonatomic, strong)NSArray *arrayIcon;

@end

NS_ASSUME_NONNULL_END
