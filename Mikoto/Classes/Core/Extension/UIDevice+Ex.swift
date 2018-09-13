//
//  UIDevice+Ex.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/9/13.
//

import Foundation

extension UIDevice {
	public var isX: Bool {
		if #available(iOS 11.0, *) {
			return windowMain?.safeAreaInsets.bottom == 35
		} else {
			return false
		}
	}
}
