//
//  List.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/16.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class ListNode {
    
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class LinkedList {
    
    var head: ListNode?
    var tail: ListNode?
    
    /// 头插法
    func appendToHead(_ val: Int) {
        let node = ListNode(val)
        if let _ = head {
            node.next = head
        } else {
            tail = node
        }
        head = node
    }
    
    /// 尾插法
    func appendToTail(_ val: Int) {
        let node = ListNode(val)
        if let _ = tail {
            tail?.next = node
        } else {
            head = node
        }
        tail = node
    }
    
}

/**
 给一个链表和一个值 x，要求将链表中所有小于 x 的值放到左边，所有大于等于 x 的值放到右边。原链表的节点顺序不能变。
 例：1->5->3->2->4->2，给定x = 3。则我们要返回1->2->2->5->3->4
 */

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    
    // 引入Dummy节点
    let preDummy = ListNode(0)
    let postDummy = ListNode(0)
    
    var pre = preDummy
    var post = postDummy
    
    var node = head
    
    // 用尾插法处理左边和右边
    while node != nil {
        if node!.val < x {
            pre.next = node
            pre = node!
        } else {
            post.next = node
            post = node!
        }
        node = node!.next
    }
    
    // 防止构成环
    post.next = nil
    // 左右拼接
    pre.next = postDummy.next
    
    return preDummy.next
}


func testLinkedList() {
    let a = [1, 5, 3, 2, 4, 2]
    let list = LinkedList()
    for node in a {
        list.appendToTail(node)
    }
    print(list)
    
    let node = partition(list.head, 3)
    print(node!)
    
    print(hasCycle(node))
    let node1 = removeIndexFromEnd(node, index: 5)
    print(node1!)
}

/**
 如何检测一个链表中是否有环？ --- 快行指针
 */

func hasCycle(_ head: ListNode?) -> Bool {
    
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            return true
        }
    }
    
    return false
}


/**
 删除链表中倒数第 n 个节点。例：1->2->3->4->5，n = 2。返回1->2->3->5。
 注意：给定 n 的长度小于等于链表的长度。
 */

func removeIndexFromEnd(_ head: ListNode?, index: Int) -> ListNode? {
    
    if head == nil {
        return head
    }
    
    // 这里还用到了 Dummy 节点，因为有可能我们要删除的是头结点。
    let dummy = ListNode(0)
    dummy.next = head
    var pre: ListNode? = dummy
    var post: ListNode? = dummy
    
    // 设置后一个节点初始位置
    for _ in 0..<index {
        if post == nil {
            break
        }
        post = post?.next
    }
    
    // 同时移动前后节点
    while post != nil && post?.next != nil {
        pre = pre?.next
        post = post?.next
    }
    
    // 删除节点
    pre?.next = pre?.next?.next
    
    return dummy.next
}
