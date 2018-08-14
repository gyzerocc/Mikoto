//
//  UIViewController+Dealloc.m
//  ForeverMyLove
//
//  Created by 龚阳 on 2018/1/12.
//  Copyright © 2018年 gongyang. All rights reserved.
//

#import "UIViewController+Dealloc.h"
#import <objc/runtime.h>

@implementation UIViewController (Dealloc)

#if DEBUG

+ (void)load {
    Method origin = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method new = class_getInstanceMethod([self class], NSSelectorFromString(@"pdealloc"));
    method_exchangeImplementations(origin, new);
}

- (void)pdealloc {
    NSLog(@"%@ -> dealloc", [self class]);
    [self pdealloc];
}

#endif

@end
