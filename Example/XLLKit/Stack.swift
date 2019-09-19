//
//  Stack.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

protocol Stack {
    
    /// 持有的元素类型
    associatedtype Element
    /// 是否为空
    var isEmpty: Bool { get }
    /// 栈的大小
    var size: Int { get }
    /// 栈顶元素
    var peek: Element? { get }
    
    /// 入栈
    mutating func push(_ newElement: Element)
    /// 出栈
    mutating func pop() -> Element?
}

struct IntStack: Stack {
    
    private var stack = [Element]()
    
    typealias Element = Int
    
    var isEmpty: Bool { return stack.isEmpty }
    
    var size: Int { return stack.count }
    
    var peek: Element? { return stack.last }
    
    mutating func push(_ newElement: Int) {
        stack.append(newElement)
    }
    
    mutating func pop() -> Element? {
        return stack.popLast()
    }
}

func test() {
    var a = IntStack()
    a.push(1)
    a.push(2)
    a.push(3)
    print(a.size)
    print(a.peek ?? 0)
}
