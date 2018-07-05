//
//  NSArray+Safe.m
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)
-(id)objectAtSafeIndex:(NSUInteger)index {
    NSInteger count = self.count;
    if (index > count - 1) {
        return nil;
    }
    return [self objectAtIndex:index];
}
@end
