//
//  UITableView+Ex.swift
//  Alamofire
//
//  Created by 龚阳 on 2018/4/16.
//

import UIKit

public extension UITableView {
    
    public func hideEmptyCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
}
