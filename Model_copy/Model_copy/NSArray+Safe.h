//
//  NSArray+Safe.h
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Safe)

/**
 崩溃处理
 */
-(id)objectAtSafeIndex:(NSUInteger)index;

@end
