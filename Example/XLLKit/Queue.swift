//
//  Queue.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

protocol Queue {
    /// 持有的数据类型
    associatedtype Element
    
    /// 队列是否为空
    var isEmpty: Bool { get }
    /// 队列大小
    var size: Int { get }
    /// 队列首元素
    var peek: Element? { get }
    /// 入队
    mutating func enQueue(_ newElement: Element)
    /// 出队
    mutating func deQueue() -> Element? 
}

struct IntQueue: Queue {
    
    typealias Element = Int
    
    private var queue = [Element]()
    
    var isEmpty: Bool { return queue.isEmpty }
    
    var size: Int { return queue.count }
    
    var peek: Int? { return queue.first }
    
    mutating func enQueue(_ newElement: Element) {
        queue.append(newElement)
    }
    
    mutating func deQueue() -> Element? {
        return queue.removeFirst()
    }
    
}

func testQueue() {
    print("queue ------ ")
    var a = IntQueue()
    a.enQueue(2)
    a.enQueue(3)
    a.enQueue(4)
    a.enQueue(5)
    a.enQueue(6)
    print(a.deQueue()!)
    print(a.deQueue()!)
    print(a.deQueue()!)
    print(a.deQueue()!)
    print(a.deQueue()!)
    
    print(pathFormat(path: "/home/"))
    print(pathFormat(path: "/a/./b/../../c/"))
}

/**
 给一个文件的绝对路径，将其简化。举个例子，路径是 "/home/"，简化后为 "/home"；路径是"/a/./b/../../c/"，简化后为 "/c"。
 */
func pathFormat(path: String) -> String {
    
    let paths = path.split(separator: "/")
    
    var result = [String]()
    
    for temp in paths {
        if temp.count == 0 || temp == "." {
            continue
        }
        if temp == ".." {
            if !paths.isEmpty {
                result.removeLast()
            }
        } else {
            result.append(String(temp))
        }
    }
    
    let str = "/" + result.joined(separator: "/")
    return str
}
