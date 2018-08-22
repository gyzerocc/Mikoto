//
//  Namespace.swift
//  Mikoto
//
//  Created by 龚阳 on 2018/4/26.
//

import Foundation

public protocol NamespaceWrappable {
    associatedtype WrapperType
    var mkt: WrapperType { get }
    static var mkt: WrapperType.Type { get }
}

public protocol TypeWrapperProtocol {
    associatedtype WrappedType
    var wrappedValue: WrappedType { get }
    init(value: WrappedType)
}

public struct NamespaceWrapper<T>: TypeWrapperProtocol {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}

public extension NamespaceWrappable {
    public var mkt: NamespaceWrapper<Self> {
        return NamespaceWrapper(value: self)
    }
    
    public static var mkt: NamespaceWrapper<Self>.Type {
        return NamespaceWrapper.self
    }
}

/* =================== */

extension String: NamespaceWrappable { }
extension TypeWrapperProtocol where WrappedType == String {
    var test: String {
        return wrappedValue
    }
}

//"foo".mkt.test
