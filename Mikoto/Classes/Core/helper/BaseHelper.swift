//
//  BaseHelper.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/7/12.
//

import Foundation

@objcMembers
public class BaseHelper: NSObject {
	
	public static let shared = BaseHelper()
	private override init() {}
	
	public class func int(string: String?) -> NSNumber? {
		if let str = string, let result = Int(str) {
			return NSNumber(value: result)
		} else {
			return nil
		}
	}
	
	public class func double(string: String?) -> NSNumber? {
		if  let str = string, let result = Double(str) {
			return NSNumber(value: result)
		} else {
			return nil
		}
	}
	
}
