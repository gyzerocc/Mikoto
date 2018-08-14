//
//  CALayer+Ex.swift
//  Base
//
//  Created by 龚阳 on 2018/4/8.
//

import UIKit

public extension CALayer {
    
    public func gradient(colors: [Any]?, locations: [NSNumber]?, startPoint: CGPoint, endPoint: CGPoint, frame: CGRect) {
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = frame
        insertSublayer(gradient, at: 0)
    }
    
}
