//
//  selfMessageViewController.h
//  ZARA
//
//  Created by 夏楠 on 2023/6/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface selfMessageViewController : UIViewController<UITableViewDelegate,
UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
//UIImagePickerControllerDelegate, UINavigationControllerDelegate实现换头像需要实现的协议

@property UITableView* tableView;
@end

NS_ASSUME_NONNULL_END
