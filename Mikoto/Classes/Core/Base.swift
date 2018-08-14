//
//  Base.swift
//  Base_Example
//
//  Created by 龚阳 on 2018/4/7.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

/// 主窗口
public var windowMain: UIWindow? {
    return UIApplication.shared.delegate?.window ?? nil
}

/// 屏幕尺寸
public var sizeScreen: CGSize {
    var size = UIScreen.main.bounds.size
    if size.height < size.width {
        let tmp = size.height
        size.height = size.width
        size.width = tmp
    }
    return size
}

/// 屏幕宽度
public var widthScreen: CGFloat {
    return sizeScreen.width
}

/// 屏幕高度
public var heightScreen: CGFloat {
    return sizeScreen.height
}

/// 延迟执行，相当于dispatch_after
///
/// - Parameters:
///   - delay: 延迟时间
///   - closure: 回调闭包
public func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

/// RGB
///
/// - Parameters:
///   - r: red
///   - g: green
///   - b: blue
/// - Returns: return RGB Color
public func RGB(_ r: CGFloat,_ g: CGFloat,_ b:CGFloat) -> UIColor {
	let n: CGFloat = 255.0
	let color = UIColor.init(red: r/n, green: g/n, blue: b/n, alpha: 1)
	return color
}

/// RGB
///
/// - Parameters:
///   - r: red
///   - g: green
///   - b: blue
///   - a: alpha
/// - Returns: return RGBA Color
public func RGBA(_ r: CGFloat,_ g: CGFloat,_ b:CGFloat,_ a: CGFloat) -> UIColor {
	let n: CGFloat = 255.0
	let color = UIColor.init(red: r/n, green: g/n, blue: b/n, alpha: a)
	return color
}


