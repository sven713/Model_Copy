//
//  BViewController.h
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


/**
 参考  https://www.jianshu.com/p/ac07c26f467d 
 */
@interface BViewController : UIViewController
- (instancetype)initWithPerson:(Person *)person;
@end
