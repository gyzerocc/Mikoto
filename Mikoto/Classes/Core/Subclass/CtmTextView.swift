//
//  CtmTextView.swift
//  Alamofire
//
//  Created by 龚阳 on 2018/5/21.
//

import UIKit

@objcMembers
public class CtmTextView: UITextView {
	
	@IBInspectable public var maxLength: Int = 200
	@IBInspectable public var filterEmoji: Bool = false
	@IBInspectable public var placeholder: String = "" {
		didSet {
			placeholderLabel.text = placeholder
			setNeedsLayout()
		}
	}
	@IBInspectable public var placeholderColor: UIColor = UIColor(white: 0.7, alpha: 0.7) {
		didSet {
			placeholderLabel.textColor = placeholderColor
			setNeedsLayout()
		}
	}
	
	private let labelX: CGFloat = 6
	private let labelY: CGFloat = 7
	
	private lazy var placeholderLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.text = placeholder
		label.textColor = placeholderColor
		label.font = font
		return label
	}()
	lazy var countLabel: UILabel = {
		let label = UILabel()
		label.textColor = placeholderColor
		label.font = UIFont.systemFont(ofSize: 12)
		label.textAlignment = .right
		return label
	}()
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	public override init(frame: CGRect, textContainer: NSTextContainer?) {
		super.init(frame: frame, textContainer: textContainer)
		setup()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func setup() {
		addSubview(placeholderLabel)
		addSubview(countLabel)
		NotificationCenter.default.addObserver(self, selector: #selector(textDidChangeNotification), name: UITextView.textDidChangeNotification, object: nil)
	}
	
	func textDidChangeNotification() {
		guard let text = text else { return }
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
		
		
		countLabel.text = "\(maxLength - temp.count)"
		placeholderLabel.isHidden = hasText
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: frame.size.width - 2 * labelX, height: 0)
		placeholderLabel.sizeToFit()
		countLabel.frame = CGRect(x: frame.size.width - labelX - 120, y: frame.size.height - labelY - 15, width: 120, height: 15)
		countLabel.text = "\(maxLength - text.count)"
	}
	
}
