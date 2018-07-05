//
//  Dog.m
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(id)copyWithZone:(NSZone *)zone {
    Dog *dog = [[Dog alloc] init];
    dog.age = self.age;
    
    return dog;
}


-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.age forKey:@"age"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}

@end
