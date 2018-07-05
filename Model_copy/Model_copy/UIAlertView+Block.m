//
//  UIAlertView+Block.m
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>
#import "NSArray+Safe.h"

static const void *s_privateAlertViewKey = "s_privateAlertViewKey";


@interface UIAlertView ()
@property (nonatomic, copy) void(^ _Nullable callBack)(UIAlertView *   _Nullable alertView, NSInteger index);
@end


@implementation UIAlertView (Block)

- (instancetype _Nonnull )sv_initWithTitle:(NSString *_Nullable)title message:(nullable NSString *)message cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(NSArray <NSString *>*)otherButtonTitles actionBlock:(void(^)(UIAlertView *alertView, NSInteger index))callBack {
    
    NSString *title1 = [otherButtonTitles objectAtSafeIndex:0];
    NSString *title2 = [otherButtonTitles objectAtSafeIndex:1];
    NSString *title3 = [otherButtonTitles objectAtSafeIndex:3];
    
//    NSString *title1 = [otherButtonTitles objectAtIndex:0];
//    NSString *title2 = [otherButtonTitles objectAtIndex:1];
//    NSString *title3 = [otherButtonTitles objectAtIndex:3];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:[UIApplication sharedApplication]
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:title1,title2,title3, nil];
    alertView.callBack = callBack; //!!!!!不是self.callBack
    [alertView show];
    
    
    return alertView;
}

-(void)setCallBack:(void (^)(UIAlertView *, NSInteger))callBack {
    objc_setAssociatedObject(self, s_privateAlertViewKey, callBack, OBJC_ASSOCIATION_COPY);
}

-(void (^)(UIAlertView *, NSInteger))callBack {
    return objc_getAssociatedObject(self, s_privateAlertViewKey);
}


@end




@interface UIApplication (BlockAction)<UIAlertViewDelegate>

@end

@implementation UIApplication (BlockAction)

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.callBack) {
        alertView.callBack(alertView, buttonIndex);
    }
}

@end
