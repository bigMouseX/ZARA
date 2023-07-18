//
//  Select.h
//  ZARA
//
//  Created by 夏楠 on 2023/5/30.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectViewController : ViewController<UIScrollViewDelegate>

@property(retain, nonatomic)UISegmentedControl *segControl;
@property(retain, nonatomic)UIScrollView *sv;
@end

NS_ASSUME_NONNULL_END
