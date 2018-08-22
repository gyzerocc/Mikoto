//
//  Regex.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/4/8.
//

import Foundation

public class Regex {
	
	//验证码正则验证
	public class func isValid(verificationCode: String) -> Bool {
		let regex = "^\\d{4,8}$"
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with:verificationCode)
	}
	
    //密码正则验证
    public class func isValid(password: String) -> Bool {
        let regex = "^[a-zA-Z0-9]{6,20}+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:password)
    }
    
    //手机正则验证
    public class func isValid(mobile: String) -> Bool {
        let regex = "^1\\d{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:mobile)
    }
    
    //邮箱正则验证
    public class func isValid(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:email)
    }
    
    //身份证号码正则验证
    public class func isValid(cardID: String) -> Bool {
        let regex = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:cardID)
    }
    
    //身份证号码正则验证(严格)
    public class func isValid(strictCardID: String) -> Bool {
        return BHBaseHelper.judgeIdentityStringValid(strictCardID)
    }
    
    //昵称正则验证
    public class func isValid(nickname: String) -> Bool {
        let regex = "^[\u{4e00}-\u{9fa5}]{2,8}+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:nickname)
    }
    
    //用户名正则验证
    public class func isValid(username: String) -> Bool {
        let regex = "^[A-Za-z0-9]{6,20}+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:username)
    }
    
    //网址正则验证
    public class func isValid(url: String) -> Bool {
        let regex = "^(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:url)
    }
	
	//数字、小数正则验证
	public class func isValid(decimal: String) -> Bool {
		let regex = "^[0-9]+([.]{0,1}[0-9]+){0,1}$"
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with:decimal)
	}
}
