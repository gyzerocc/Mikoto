//
//  ViewController.swift
//  Mikoto
//
//  Created by 184453324@qq.com on 08/13/2018.
//  Copyright (c) 2018 184453324@qq.com. All rights reserved.
//

import UIKit
import Mikoto

var windowMain: UIWindow? {
	return UIApplication.shared.delegate?.window ?? nil
}
var sizeScreen: CGSize {
	var size = UIScreen.main.bounds.size
	if size.height < size.width {
		let tmp = size.height
		size.height = size.width
		size.width = tmp
	}
	return size
}
var widthScreen: CGFloat {
	return sizeScreen.width
}
var heightScreen: CGFloat {
	return sizeScreen.height
}
func delay(_ delay: Double, closure: @escaping () -> Void) {
	DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
		closure()
	}
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

