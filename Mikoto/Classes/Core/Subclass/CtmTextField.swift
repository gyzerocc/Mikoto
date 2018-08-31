//
//  CtmTextField.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/4/28.
//

import UIKit

@objcMembers
public class CtmTextField: UITextField {
	
	@IBInspectable public var maxLength: Int = 200
	@IBInspectable public var filterEmoji: Bool = false  // 是否过滤表情
	@IBInspectable public var toFixed: Int = 0  // 小数点位数
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func setup() {
		addTarget(self, action: #selector(textChanged(textField:)), for: .editingChanged)
	}
	
	func textChanged(textField: UITextField) {
		guard let text = textField.text else { return }
		var temp = text
		
		// 限制长度
		if temp.count > maxLength {
			temp = String(temp[..<temp.index(temp.startIndex, offsetBy: maxLength)])
			self.text = temp
		}
		
		// 筛选表情
		if filterEmoji && temp.containEmoji {
			temp = temp.removeEmoji
			self.text = temp
		}
		
		// 保留小数点
		if toFixed > 0 && temp.contains(".") {
			if let _ = Double(temp) {
				let arr = temp.components(separatedBy: ".")
				if let decimal = arr.last, decimal.count > toFixed {
					temp = String(temp[..<temp.index(temp.endIndex, offsetBy: -1)])
					self.text = temp
				}
			}
		}
	}
	
}
