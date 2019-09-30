//
//  BinarySearchTree.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

/// 二叉搜索树
class BinarySearchTree: BinaryTree {
    
    func createNode(_ element: Int, _ parent: TreeNode? = nil) -> TreeNode {
        return TreeNode(element, parent)
    }
    
    /// 添加元素
    func add(e: Int) {
        // 如果是空树，先设置根节点
        if root == nil {
            root = createNode(e)
            size += 1
            // 新添加节点之后的处理 (本人认为此处可以不做处理) - 添加之后做平衡二叉树
            afterAdd(root!)
            return
        }
        // 如果不是空树
        var parent = root
        var node = root
        var cmp = 0
        while node != nil {
            cmp = e - node!.element
            parent = node
            if cmp > 0 {
                node = node!.right
            } else if cmp < 0 {
                node = node!.left
            } else { // 如果相等直接覆盖旧值，然后退出
                node!.element = e
                return
            }
        }
        
        let newNode = createNode(e, parent)
        if cmp > 0 {
            parent?.right = newNode
        } else {
            parent?.left = newNode
        }
        size += 1
        // 新添加节点之后的处理 - 添加之后做平衡二叉树
        afterAdd(newNode)
    }
    
    /// 删除元素
    func remove(elemet: Int) {
        remove(e: node(elemet))
    }
    
    /// 删除元素：内部实现
    private func remove(e: TreeNode?) {
        var node = e
        if node == nil {
            return
        }
        size -= 1
        
        /*
         * 删除节点分三种情况：
         * 1.节点的度为2：
         * 2.节点的度为1：用子节点代替原节点的位置
         * 3.节点的度为0，即叶子节点：直接删除
         */
        
        if node!.hasTwoChildren { // 1.节点的度为2：
            // 先找到前驱节点
            let pre = predecessor(node)
            // 用前驱节点的值覆盖度为2的节点的值
            node?.element = pre?.element ?? 0
            // 删除前驱节点,但不是现在立马删除
            node = pre
        }
        
        // 删除node节点（node的度必然是1或者0）
        let replaceNode = node?.left != nil ? node?.left : node?.right
        
        if replaceNode != nil { // 2.节点的度为1：用子节点代替原节点的位置
            // 更改parent
            replaceNode?.parent = node?.parent
            if node === root {
                root = replaceNode
            } else if node!.isLeftChild {
                node?.parent?.left = replaceNode
            } else {
                node?.parent?.right = replaceNode
            }
            // 删除节点之后的处理
            afterRemove(node!)
        } else { // 3.节点的度为0，即叶子节点：直接删除
            if node === root { // node是叶子节点并且是根节点
                root = nil
                // 删除节点之后的处理
                afterRemove(node!)
            } else {
                if node?.isLeftChild ?? false {
                    node?.parent?.left = nil
                } else {
                    node?.parent?.right = nil
                }
                // 删除节点之后的处理
                afterRemove(node!)
            }
        }
    }
    
    /// 是否包含某元素
    func contains(element: Int) -> Bool {
        return node(element) == nil ? false : true
    }
    
    /// 根据元素内容获取节点
    func node(_ element: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        var node = root
        while node != nil {
            let cmp = element - node!.element
            if cmp == 0 {
                return node
            } else if cmp > 0 {
                node = node?.right
            } else {
                node = node?.left
            }
        }
        return nil
    }
    
    /*
     * 添加节点元素之后，自平衡二叉树，用于AVL树和红黑树
     */
    func afterAdd(_ node: TreeNode) { }
    
    /*
     * 删除节点元素之后，自平衡二叉树，用于AVL树和红黑树
     */
    func afterRemove(_ node: TreeNode) { }
    
}


