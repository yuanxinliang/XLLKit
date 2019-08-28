//
//  XL.swift
//  XLLKit
//
//  Created by XL ZZCM on 2019/8/28.
//

public struct XL<Base> {
    var base: Base
    init(_ base: Base) { self.base = base }
}

public protocol XLCompatible { }

public extension XLCompatible {
    static var xl: XL<Self>.Type { return XL<Self>.self }
    var xl: XL<Self> { return XL(self) }
}
