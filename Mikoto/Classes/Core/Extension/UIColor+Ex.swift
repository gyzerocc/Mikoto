//
//  UIColor+Ex.swift
//  Base
//
//  Created by 龚阳 on 2018/4/8.
//

import UIKit

extension UIColor {
	
	@available(iOS 10.0, *)
	public var toImage: UIImage {
		let bounds = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
		let renderer = UIGraphicsImageRenderer(bounds: bounds)
		return renderer.image(actions: { (context) in
			self.setFill()
			context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
		})
	}
    
    public class func RGB(_ r: CGFloat,_ g: CGFloat,_ b:CGFloat) -> UIColor {
        let n: CGFloat = 255.0
        let color = UIColor.init(red: r/n, green: g/n, blue: b/n, alpha: 1)
        return color
    }
    

    public class func RGBA(_ r: CGFloat,_ g: CGFloat,_ b:CGFloat,_ a: CGFloat) -> UIColor {
        let n: CGFloat = 255.0
        let color = UIColor.init(red: r/n, green: g/n, blue: b/n, alpha: a)
        return color
    }
    
    
    public class func HEX(_ hex: UInt32) -> UIColor {
        return UIColor.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((hex & 0xFF00) >> 8) / 255.0,
                            blue: CGFloat((hex & 0xFF)) / 255.0,
                            alpha: 1.0)
    }
    
    
    public class func HEX(_ hex: String) -> UIColor {
        var red: UInt32 = 0, green: UInt32 = 0, blue: UInt32 = 0
        var hex = hex
        
        if hex.hasPrefix("#") {
            hex = String(hex[hex.index(after: hex.startIndex)...])
        }
        
        Scanner(string: String(hex[hex.startIndex..<hex.index(hex.startIndex, offsetBy: 2)])).scanHexInt32(&red)
        Scanner(string: String(hex[hex.index(hex.startIndex, offsetBy: 2)..<hex.index(hex.startIndex, offsetBy: 4)])).scanHexInt32(&green)
        Scanner(string: String(hex[hex.index(hex.startIndex, offsetBy: 4)...])).scanHexInt32(&blue)
        
        return UIColor.init(red: CGFloat(red) / 255.0,
                            green: CGFloat(green) / 255.0,
                            blue: CGFloat(blue) / 255.0,
                            alpha: 1.0)
    }
}

// MARK: - Gradient
extension UIColor {
    
    public class func gradient(startColor:UIColor,endColor:UIColor,fraction:CGFloat) -> UIColor {
        var startR: CGFloat = 0, startG: CGFloat = 0, startB: CGFloat = 0, startA: CGFloat = 0
        startColor.getRed(&startR, green: &startG, blue: &startB, alpha: &startA)
        
        var endR: CGFloat = 0, endG: CGFloat = 0, endB: CGFloat = 0, endA: CGFloat = 0
        endColor.getRed(&endR, green: &endG, blue: &endB, alpha: &endA)
        
        let resultA = startA + (endA - startA) * fraction
        let resultR = startR + (endR - startR) * fraction
        let resultG = startG + (endG - startG) * fraction
        let resultB = startB + (endB - startB) * fraction
        
        return UIColor(red: resultR, green: resultG, blue: resultB, alpha: resultA)
    }
}

extension UIColor {
    
    public class func niceBlack() -> UIColor {
        return UIColor(red: 30.0/255.0, green: 32.0/255.0, blue: 40.0/255.0, alpha: 1)
    }
    
    public class func niceDuckBlack() -> UIColor {
        return UIColor(red: 20.0/255.0, green: 21.0/255.0, blue: 27.0/255.0, alpha: 1)
    }
    
    public class func niceRed() -> UIColor {
        return UIColor(red: 237.0/255.0, green: 66.0/255.0, blue: 82.0/255.0, alpha: 1)
    }
    
    public class func niceJHSRed() -> UIColor {
        return UIColor(red: 235.0/255.0, green: 0.0/255.0, blue: 18.0/255.0, alpha: 1)
    }
}
