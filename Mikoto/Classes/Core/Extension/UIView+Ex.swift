//
//  UIView+Ex.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/4/8.
//

import UIKit

extension UIView {
	
	public func safeArea() -> UIEdgeInsets {
		if #available(iOS 11.0, *) {
			return safeAreaInsets
		} else {
			var insets: UIEdgeInsets = .init(top: 20, left: 0, bottom: 0, right: 0)
			if let _ = superViewController()?.navigationController {
				insets.top = 64
			}
			if let _ = superViewController()?.tabBarController {
				insets.bottom = 49
			}
			return insets
		}
	}
    
    public func rounded(_ radius: CGFloat = 0) {
        if radius != 0 {
            layer.cornerRadius = radius
        } else {
            let r = CGFloat.minimum(frame.size.width, frame.size.height)
            layer.cornerRadius = r/2
        }
        self.layer.masksToBounds = true
    }
    
    /// 浮动效果
    public func floating() {
        let path = CAKeyframeAnimation(keyPath: "path")
		path.calculationMode = CAAnimationCalculationMode.paced
		path.fillMode = CAMediaTimingFillMode.forwards
        path.repeatCount = Float.greatestFiniteMagnitude
        path.autoreverses = true
		path.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName(rawValue: "linear"))
        path.duration = CFTimeInterval(arc4random_uniform(3)+4)
        let bpath = UIBezierPath(ovalIn: frame.insetBy(dx: bounds.size.width/2-5, dy: bounds.size.width/2-5))
        path.path = bpath.cgPath
        layer.add(path, forKey: "path")
        
        let scalex = CAKeyframeAnimation(keyPath: "transform.scale.x")
        scalex.values = [1.0, 1.1, 1.0]
        scalex.keyTimes = [0.0, 0.5, 1.0]
        scalex.repeatCount = Float.greatestFiniteMagnitude
        scalex.autoreverses = true
        scalex.duration = CFTimeInterval(arc4random_uniform(3)+4)
        layer.add(scalex, forKey: "scalex")
        
        let scaley = CAKeyframeAnimation(keyPath: "transform.scale.y")
        scaley.values = [1.0, 1.1, 1.0]
        scaley.keyTimes = [0.0, 0.5, 1.0]
        scaley.repeatCount = Float.greatestFiniteMagnitude
        scaley.autoreverses = true
        scaley.duration = CFTimeInterval(arc4random_uniform(3)+4)
        layer.add(scaley, forKey: "scaley")
    }
    
    public func findAndResignFirstResponder() -> Bool {
        if self.isFirstResponder {
            self.resignFirstResponder()
            return true
        }
        
        for subview in self.subviews {
            if subview.findAndResignFirstResponder() {
                return true
            }
        }
        
        return false
    }
    
}
