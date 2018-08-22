//
//  String+Ex.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/4/8.
//

import Foundation

extension String {
	
	/// 字符串长度 （中文&emoji）== 两个字符
	public var textLength: UInt {
		var num: UInt = 0
		for c in self {
			if let count = String(c).data(using: .utf8)?.count, count >= 3 {
				num += 2
			} else {
				num += 1
			}
		}
		return num
	}
	
	/// 去掉emoji
	public var removeEmoji: String {
		return BHBaseHelper.removeEmoji(with: self)
	}
	
	/// 特殊字符
	public var isSpecialCharacter: Bool {
		let set = CharacterSet(charactersIn: "@／:;（）¥「」!,.?<>£＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\"/\n\t\r")
		if let _ = self.rangeOfCharacter(from: set) {
			return true
		}
		return false
	}
    
    /// 方便转NSString
    public var NS: NSString {
        return (self as NSString)
    }
    
    /// 本地化字符串
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    public var url: URL? {
        return URL(string: self)
    }
    
    public var dictionary: Dictionary<String, AnyObject>? {
        guard let data = self.data(using: .utf8) else { return nil }
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary<String, AnyObject>
        } catch {
            return nil
        }
    }
    
    public var array: Array<AnyObject>? {
        guard let data = self.data(using: .utf8) else { return nil }
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Array<AnyObject>
        } catch {
            return nil
        }
    }
    
    public enum info {
        case displayName
        case version
        case language
        case systemVersion
    }
    
    public static func app(_ info: info) -> String? {
        switch info {
        case .displayName:
            return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
        case .version:
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        case .language:
            return Locale.preferredLanguages.first
        case .systemVersion:
            return UIDevice.current.systemVersion
        }
    }
    
    public enum directory {
        case home
        case document
        case library
        case cache
        case tmp
    }
    
    public static func path(_ directory: directory) -> String {
        switch directory {
        case .home:
            return NSHomeDirectory()
        case .document:
            return NSHomeDirectory() + "/Documents"
        case .library:
            return NSHomeDirectory() + "/Library"
        case .cache:
            return NSHomeDirectory() + "/Library/Caches"
        case .tmp:
            return NSHomeDirectory() + "/tmp"
        }
    }
    
    public func textSize(font: UIFont, refrain: CGSize) -> CGSize {
        var size: CGSize
        let str = NSString(string: self)
        let attr = [NSAttributedStringKey.font: font]
        
        if refrain.equalTo(.zero) {
            size = str.size(withAttributes: attr)
        } else {
            //truncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。
            //如果指定了usesLineFragmentOrigin选项，则该选项被忽略
            //usesFontLeading计算行高时使用行间距。（字体大小+行间距=行高）
            let options: NSStringDrawingOptions = [.truncatesLastVisibleLine, .usesLineFragmentOrigin, .usesFontLeading]
            let rect = str.boundingRect(with: refrain, options: options, attributes: attr, context: nil)
            size = rect.size
        }
        return size
    }
	
	/// 移除起始、结束位置的空白、换行符
    public func trim() -> String {
        let str = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return str
    }
    
}
