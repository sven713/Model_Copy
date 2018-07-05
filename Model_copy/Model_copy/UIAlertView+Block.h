//
//  UIAlertView+Block.h
//  Model_copy
//
//  Created by sve on 2018/7/5.
//  Copyright © 2018年 sve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Block)

// alertView有几个按钮 几个都行
// 给AlertView添加block回调,技术点:利用关联对象,给分类添加block属性, 写一个新的方法接管AlertView的工厂方法
// 注意接管AlertView需要直接给这个新创建的AlertView赋值,不能用self.block alertView.callBack = callBack; //!!!!!不是self.callBack
// 技术点,用UIApplication单例作为AlertView的代理, 给UIApplication添加分类,遵守AlertView的协议,实现代理方法,在代理方法里面调用AlertView的block

- (instancetype _Nonnull )sv_initWithTitle:(NSString *_Nullable)title message:(nullable NSString *)message cancelButtonTitle:(nullable NSString *)cancelButtonTitle otherButtonTitles:(NSArray <NSString *>*_Nullable)otherButtonTitles actionBlock:(void(^_Nullable)(UIAlertView * _Nullable alertView, NSInteger index))callBack;



@end
