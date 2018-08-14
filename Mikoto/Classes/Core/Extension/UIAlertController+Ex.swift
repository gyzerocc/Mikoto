//
//  UIAlertController+Ex.swift
//  Pods
//
//  Created by 龚阳 on 2018/4/25.
//

import UIKit

extension UIAlertController {
    
    public class func showMessage(title: String = "提示".localized, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定".localized, style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    public class func showAlert(title: String = "提示".localized, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for a in actions {
            alert.addAction(a)
        }
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}
