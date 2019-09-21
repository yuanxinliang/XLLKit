//
//  TreeNode.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class TreeNode {
    
    var element: Int = 0
    var left: TreeNode?
    var right: TreeNode?
    weak var parent: TreeNode?

    init(_ element: Int, _ parent: TreeNode? = nil) {
        self.element = element
        self.parent = parent
    }
    
    /// 是否为叶子节点
    var isLeaf: Bool { return left == nil && right == nil }
    
    /// 是否只有一个子节点
    var hasOnlyChildren: Bool { return (left != nil && right == nil) || (left == nil && right != nil) }
    
    /// 是否有两个子节点
    var hasTwoChildren: Bool { return left != nil && right != nil }
    
    /// 是否为左子节点
    var isLeftChild: Bool { return parent != nil && self === parent?.left }
    
    /// 是否为右子节点
    var isRightChild: Bool { return parent != nil && self === parent?.right }
    
    /// 兄弟节点
    var sibling: TreeNode? {
        get {
            if isLeftChild {
                return parent?.right
            }
            if isRightChild {
                return parent?.left
            }
            return nil
        }
    }
    
}
