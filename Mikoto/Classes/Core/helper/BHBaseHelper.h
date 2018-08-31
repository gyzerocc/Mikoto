//
//  BHBaseHelper.h
//  Mikoto
//
//  Created by 龚阳 on 2018/4/8.
//

#import <UIKit/UIKit.h>

@interface BHBaseHelper : NSObject


/**
 判断18位身份证是否正确

 @param identityString 身份证字符串
 @return 判断结果
 */
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;

/**
 返回当前展示的控制器

 @return 当前展示的控制器
 */
+ (UIViewController *)topViewController;

/**
 去除表情
 
 @param string 将要去除表情的字符串
 @return 已经去除表情的字符串
 */
+ (nonnull NSString *)removeEmojiWithString:(nonnull NSString *)string;
+ (BOOL)containEmojiWithString:(nonnull NSString *)string;

@end

@interface UIView (Ex)

/**
 当前view的父控制器

 @return 父控制器
 */
- (nullable UIViewController *)superViewController;

@end
