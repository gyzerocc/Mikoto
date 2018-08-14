//
//  HUD.swift
//  ForeverMyLove
//
//  Created by 龚阳 on 2018/1/12.
//  Copyright © 2018年 gongyang. All rights reserved.
//

import UIKit
import SVProgressHUD
import Toast

public let HUD = Hud.shared

final public class Hud {
    
    static let shared = Hud()
    private init() {
        // svp
        SVProgressHUD.setMaximumDismissTimeInterval(8.0)
        SVProgressHUD.setMinimumDismissTimeInterval(2.0)
        
        // toast
        CSToastManager.setQueueEnabled(false)
        CSToastManager.setDefaultDuration(2)
        CSToastManager.setDefaultPosition(CGPoint(x: widthScreen/2, y: heightScreen*0.8))
    }
    
    public func show() {
        SVProgressHUD.show()
    }
    
    public func dismiss() {
        SVProgressHUD.dismiss()
    }
    
    public func show(status: String?) {
        SVProgressHUD.show(withStatus: status)
    }
    
    public func show(info: String?) {
        SVProgressHUD.showInfo(withStatus: info)
    }
    
    public func show(success: String?) {
        SVProgressHUD.showSuccess(withStatus: success)
    }
    
    public func show(error: String?) {
        SVProgressHUD.showError(withStatus: error)
    }
    
    public func show(progress: Float, status: String?) {
        SVProgressHUD.showProgress(progress, status: status)
    }
    
    // MARK: - Toast
    public func show(toast: String) {
        guard let wd = UIApplication.shared.keyWindow else {
            return
        }
        wd.makeToast(toast)
    }
    
    public func showMessage(title: String? = "提示".localized, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定".localized, style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    public func showAlert(title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for a in actions {
            alert.addAction(a)
        }
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }

}
