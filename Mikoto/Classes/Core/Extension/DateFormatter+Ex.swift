//
//  DateFormatter+Ex.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/4/8.
//

import Foundation

extension DateFormatter {
    
    private static var _formatter = DateFormatter()
    
    public class func date(string: String) -> Date? {
        return DateFormatter.date(string: string, format: "yyyy-MM-dd")
    }
    
    public class func datetime(string: String) -> Date? {
        return DateFormatter.date(string: string, format: "yyyy-MM-dd hh:mm:ss")
    }
    
    public class func date(string: String, format: String) -> Date? {
        _formatter.dateFormat = format
        return _formatter.date(from: string)
    }
    
    public class func string(date: Date, format: String) -> String {
        _formatter.dateFormat = format
        return _formatter.string(from: date)
    }
    
}
