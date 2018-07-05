//
//  AModel.m
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)copyWithZone:(NSZone *)zone {
    Person *person = [[Person alloc] init];
    person.name = self.name;
    person.dog = self.dog;
    
    return person;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.dog forKey:@"dog"];
}

// 取出??
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        self.dog = [aDecoder decodeObjectForKey:@"dog"]; // 必须用下划线么?
    }
    return self;
}




@end
