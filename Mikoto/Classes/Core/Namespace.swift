//
//  Namespace.swift
//  Base
//
//  Created by 龚阳 on 2018/4/26.
//

import Foundation

public protocol NamespaceWrappable {
    associatedtype WrapperType
    var ba: WrapperType { get }
    static var ba: WrapperType.Type { get }
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
    public var ba: NamespaceWrapper<Self> {
        return NamespaceWrapper(value: self)
    }
    
    public static var ba: NamespaceWrapper<Self>.Type {
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

//"foo".ba.test
