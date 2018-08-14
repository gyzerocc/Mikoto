//
//  Array+Ex.swift
//  Base
//
//  Created by 龚阳 on 2018/4/8.
//

import Foundation

public extension Array {
    
    public var toString: String? {
		let str: String?
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            str = String(data: data, encoding: .utf8)
        } catch {
            str = nil
        }
		return str
    }
    
    public var toJSON: Data? {
		let data: Data?
        do {
            data = try JSONSerialization.data(withJSONObject: self, options: .init(rawValue: 0))
        } catch {
            data = nil
        }
		return data
    }
    
}
