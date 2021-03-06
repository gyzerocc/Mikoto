//
//  Mikoto.swift
//  Mikoto_Example
//
//  Created by 龚阳 on 2018/4/7.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

internal var windowMain: UIWindow? {
    return UIApplication.shared.delegate?.window ?? nil
}
internal var sizeScreen: CGSize {
    var size = UIScreen.main.bounds.size
    if size.height < size.width {
        let tmp = size.height
        size.height = size.width
        size.width = tmp
    }
    return size
}
internal var widthScreen: CGFloat {
    return sizeScreen.width
}
internal var heightScreen: CGFloat {
    return sizeScreen.height
}
internal func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}
internal func debugOnly(_ body: () -> Void) {
	assert({ body(); return true }())
}


/// RGB
///
/// - Parameters:
///   - r: red
///   - g: green
///   - b: blue
/// - Returns: return RGB Color
@available(*, deprecated, renamed: "UIColor.RGB(_:_:_:)")
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
@available(*, deprecated, renamed: "UIColor.RGBA(_:_:_:_:)")
public func RGBA(_ r: CGFloat,_ g: CGFloat,_ b:CGFloat,_ a: CGFloat) -> UIColor {
	let n: CGFloat = 255.0
	let color = UIColor.init(red: r/n, green: g/n, blue: b/n, alpha: a)
	return color
}


