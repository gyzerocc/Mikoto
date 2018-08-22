//
//  UIFont+Ex.swift
//  Base
//
//  Created by 龚阳 on 2018/4/25.
//

import UIKit

extension UIFont {
    
    public class func printAllNames() {
        let familyNames = UIFont.familyNames
        
        for familyName in familyNames {
            print("-------\(familyName)-------")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print(fontName)
            }
        }
    }
}
