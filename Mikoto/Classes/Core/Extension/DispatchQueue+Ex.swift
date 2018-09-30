//
//  DispatchQueue+Ex.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/4/8.
//

import Foundation

extension DispatchQueue {
    
    private static var _onceTracker = [String]()
	
    public class func once(token: String, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
	
}
