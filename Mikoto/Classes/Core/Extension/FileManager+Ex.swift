//
//  FileManager+Ex.swift
//  Base
//
//  Created by 龚阳 on 2018/4/25.
//

import Foundation

extension FileManager {
    
    public class func createDirectoryIfNotExists(path:String) -> Bool {
        
        let fileManager = self.default
        var isDir: ObjCBool = false
        let exists = fileManager.fileExists(atPath: path, isDirectory: &isDir)
        if exists == false || isDir.boolValue == false {
            do {
                try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            }catch {
                return false
            }
        }
        return true
    }
    
    public class func removeItemIfExists(path:String) ->Bool {
        let fileManager = self.default
        var isDir: ObjCBool = false
        let exists = fileManager.fileExists(atPath: path, isDirectory: &isDir)
        if exists == true  {
            do {
                try fileManager.removeItem(atPath: path)
            }catch {
                return false
            }
        }
        return true
    }
}
