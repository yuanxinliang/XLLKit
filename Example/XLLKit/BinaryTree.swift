//
//  BinaryTree.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class BinaryTree {
    
    var root: TreeNode?
    
    var size: Int = 0
    
    var isEmpty: Bool { return size == 0 ? true : false }
    
    func clear() {
        root = nil
        size = 0
    }
    
    /// 是否为完全二叉树
    func isComplete() -> Bool {
     
        if root == nil {
            return false
        }
        
        var nodes = [TreeNode]()
        nodes.append(root!)
        var isLeaf = false
        
        while !nodes.isEmpty {
            
            let node = nodes.removeFirst()
            
            if isLeaf && !node.isLeaf {
                return false
            }
            
            if node.left != nil {
                nodes.append(node.left!)
            } else {
                if node.right != nil {
                    return false
                }
            }
            
            if node.right != nil {
                nodes.append(node.right!)
            } else { // 后面遍历的节点都必须是叶子节点
                isLeaf = true
            }
        }
        
        return true
    }
    
    /// 树的高度：通过层序遍历计算高度
    func heightOfIteration() -> Int {
        
        if root == nil {
            return 0
        }
        // 初始树的高度
        var height = 0
        // 每一层存储的元素数量，默认第一次是根节点
        var levelSize = 1
        
        var nodes = [TreeNode]()
        nodes.append(root!)
        
        while !nodes.isEmpty {
            
            let node = nodes.removeFirst()
            levelSize -= 1
            
            if node.left != nil {
                nodes.append(node.left!)
            }
            
            if node.right != nil {
                nodes.append(node.right!)
            }
            
            if levelSize == 0 {
                levelSize = nodes.count
                height += 1
            }
        }
        
        return height
    }
    
    /// 树的高度：通过递归计算高度
    func heigthOfRecursion() -> Int {
        return height(root)
    }
    
    func height(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        return 1 + max(height(node?.left), height(node?.right))
        
    }
    
    
}

// MARK: - 遍历

extension BinaryTree {
    
    /// 前序遍历
    func preorderTraversal() {
        print("前序遍历------")
        preorderTraversal(node: root)
    }
    
    private func preorderTraversal(node: TreeNode?) {
        if node == nil {
            return
        }
        print(node!.element)
        preorderTraversal(node: node?.left)
        preorderTraversal(node: node?.right)
    }
    
    /// 中序遍历
    func inorderTraversal() {
        print("中序遍历------")
        inorderTraversal(node: root)
    }
    
    private func inorderTraversal(node: TreeNode?) {
        if node == nil {
            return
        }
        inorderTraversal(node: node?.left)
        print(node!.element)
        inorderTraversal(node: node?.right)
    }
    
    /// 后序遍历
    func postorderTraversal() {
        print("后序遍历------")
        postorderTraversal(node: root)
    }
    
    private func postorderTraversal(node: TreeNode?) {
        if node == nil {
            return
        }
        postorderTraversal(node: node?.left)
        postorderTraversal(node: node?.right)
        print(node!.element)
    }
    
    /// 层序遍历
    func levelOrderTraversal() {
        print("层序遍历------")
        levelOrderTraversal(root)
    }
    
    private func levelOrderTraversal(_ node: TreeNode?) {
        if node == nil {
            return
        }
        
        var nodes = [TreeNode]()
        nodes.append(node!)
        
        while !nodes.isEmpty {
            
            let node = nodes.removeFirst()
            print(node.element)
            
            if node.left != nil {
                nodes.append(node.left!)
            }
            
            if node.right != nil {
                nodes.append(node.right!)
            }
        }
        
    }
}

// MARK: - 遍历：优化添加closure

extension BinaryTree {
    /// 前序遍历
    func preorderTraversal(forEach handle: (Int) -> Void) {
        preorderTraversal(root, handle)
    }
    
    private func preorderTraversal(_ node: TreeNode?, _ handle: (Int) -> Void) {
        if node == nil {
            return
        }
        handle(node!.element)
        preorderTraversal(node?.left, handle)
        preorderTraversal(node?.right, handle)
    }
    
    /// 中序遍历
    func inorderTraversal(forEach handle: (Int) -> Void) {
        inorderTraversal(root, handle)
    }
    
    private func inorderTraversal(_ node: TreeNode?, _ handle: (Int) -> Void) {
        if node == nil {
            return
        }
        inorderTraversal(node?.left, handle)
        handle(node!.element)
        inorderTraversal(node?.right, handle)
    }
    
    /// 后序遍历
    func postorderTraversal(forEach handle: (Int) -> Void) {
        postorderTraversal(root, handle)
    }
    
    private func postorderTraversal(_ node: TreeNode?, _ handle: (Int) -> Void) {
        if node == nil {
            return
        }
        postorderTraversal(node?.left, handle)
        postorderTraversal(node?.right, handle)
        handle(node!.element)
    }
    
    /// 层序遍历
    func levelOrderTraversal(forEach handle: (Int) -> Void) {
        levelOrderTraversal(root, handle)
    }
    
    private func levelOrderTraversal(_ node: TreeNode?, _ handle: (Int) -> Void) {
        if node == nil {
            return
        }
        var nodes = [TreeNode]()
        nodes.append(node!)
        
        while !nodes.isEmpty {
            
            let node = nodes.removeFirst()
            handle(node.element)
            
            if node.left != nil {
                nodes.append(node.left!)
            }
            
            if node.right != nil {
                nodes.append(node.right!)
            }
        }
    }
}

// MARK: - 前驱、后继

extension BinaryTree {
    
    /// 前驱节点 predecessor
    func predecessor(_ node: TreeNode?) -> TreeNode? {
        return nil
    }
    
    /// 后继节点 successor node
    func successor(_ node: TreeNode?) -> TreeNode? {
        return nil
    }
    
}

extension BinaryTree {
    
    func printTree() {
        print("打印树：------------")
        var str = ""
        preorderPrint(node: root, preStr: "", str: &str)
        print(str)
    }
    
    func preorderPrint(node: TreeNode?, preStr: String, str: inout String) {
        
        if node == nil {
            return
        }
        
        str.append(preStr)
        str.append("【")
        str.append("\(node!.element)")
        str.append("】")
        str.append("\n")
    
        preorderPrint(node: node?.left, preStr: preStr + "〖L〗", str: &str)
        preorderPrint(node: node?.right, preStr: preStr + "〖R〗", str: &str)
    }
    
    func invertBT(){
        invertBinaryTree(node: root)
    }
    
    /// 翻转二叉树invertBinaryTree
    func invertBinaryTree(node: TreeNode?) {
        if node == nil {
            return
        }
        
        let left = node?.left
        let right = node?.right
        node?.left = right
        node?.right = left
        
        invertBinaryTree(node: left)
        invertBinaryTree(node: right)
    }
}


