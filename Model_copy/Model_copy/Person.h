//
//  AModel.h
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject<NSCopying,NSCoding>
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) Dog *dog;
@end
