//
//  Security.swift
//  DoctorProj
//
//  Created by 龚阳 on 2017/6/8.
//  Copyright © 2017年 四川联影科技有限公司. All rights reserved.
//

import Foundation
import CryptoSwift

public class Security {
    /// 单例
    public static let shared = Security()
    private init() {}
    
    /// AES_CBC_128 加密
    ///
    /// - Parameters:
    ///   - encode: 欲加密字符串
    ///   - key: key description
    ///   - iv: iv description
    /// - Returns: return value (失败返回nil)
    public func AESEncrypt(encode: String, key: String, iv: String) -> String? {
        guard let data = encode.data(using: String.Encoding.utf8) else {
            assertionFailure("原始数据为空!")
            return nil
        }
        do {
            let encrypted = try AES(key: key, iv: iv, padding: .pkcs7).encrypt(data.bytes)
            return Data.init(bytes: encrypted).base64EncodedString(options: .lineLength64Characters)
        } catch {
            // 或许这里应该抛出异常  ^_^~~
            assertionFailure("AES加密失败!")
            return nil
        }
    }
    
    /// AES_CBC_128 解密
    ///
    /// - Parameters:
    ///   - decode: 欲解密字符串
    ///   - key: key description
    ///   - iv: iv description
    /// - Returns: return value (失败返回nil)
    public func AESDecrypt(decode: String, key: String, iv: String) -> String? {
        guard let data = Data.init(base64Encoded: decode, options: .ignoreUnknownCharacters) else {
			assertionFailure("原始数据为空!")
            return nil
        }
        do {
            let decrypted = try AES(key: key, iv: iv, padding: .pkcs7).decrypt(data.bytes)
            let encoded = Data.init(bytes: decrypted)
            return String(data: encoded, encoding: .utf8)
        } catch {
			assertionFailure("AES解密失败!")
            return nil
        }
    }
    
    /// RSA 加密
    ///
    /// - Parameters:
    ///   - encode: 加密字符串
    ///   - publicKey: RSA公钥
    /// - Returns: return value description
    public func RSAEncrypt(encode: String, publicKey: String) -> String? {
        return RSA.encryptString(encode, publicKey: publicKey)
    }
}
