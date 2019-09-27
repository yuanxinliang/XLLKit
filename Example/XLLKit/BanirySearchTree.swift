//
//  BanirySearchTree.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class BanirySearchTree: BinaryTree {
    
    func createNode(_ element: Int, _ parent: TreeNode? = nil) -> TreeNode {
        return TreeNode(element, parent)
    }
    
    /// 添加元素
    func add(e: Int) {
        // 如果是空树，先设置根节点
        if root == nil {
            root = createNode(e)
            size += 1
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
        afterAdd(node: newNode)
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
        
        /// 删除节点分三种情况：
        ///
        /// 1.节点的度为2：
        /// 2.节点的度为1：用子节点代替原节点的位置
        /// 3.节点的度为0，即叶子节点：直接删除
        
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
            
            if node === root {
                root = replaceNode
                replaceNode?.parent = nil
            } else if node!.isLeftChild {
                replaceNode?.parent = node?.parent
                node?.parent?.left = replaceNode
            } else {
                replaceNode?.parent = node?.parent
                node?.parent?.right = replaceNode
            }
            
        } else { // 3.节点的度为0，即叶子节点：直接删除
            if node === root { // node是叶子节点并且是根节点
                root = nil
            } else {
                if node?.isLeftChild ?? false {
                    node?.parent?.left = nil
                } else {
                    node?.parent?.right = nil
                }
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
    func afterAdd(node: TreeNode) { }
    
    /*
     * 删除节点元素之后，自平衡二叉树，用于AVL树和红黑树
     */
    func afterRemove(node: TreeNode) { }
    
}

// MARK: - 测试

func testBST() {
    let bst = BanirySearchTree()
    
    for i in 1...10 {
        bst.add(e: i)
    }
    
}

func testBST3() {
    let a = [10,8,14,4,9,12,15,2,5,11]
    let bst = BanirySearchTree()
    for i in a {
        bst.add(e: i)
    }
    
    bst.printTree()
    bst.remove(elemet: 15)
    bst.printTree()
}

func testBST2() {
    let a = [10,8,14,4,9,12,15,2,5,11]
    let bst = BanirySearchTree()
    for i in a {
        bst.add(e: i)
    }
    
    let node = bst.node(4)
    let pre = bst.predecessor(node)
    let pos = bst.successor(node)
    print(pre?.element ?? 0)
    print(pos?.element ?? 0)
    print(node as Any)
}

func testBST1() {
    
    let a = [10,8,14,4,9,12,15,2,5]
    let bst = BanirySearchTree()
    for i in a {
        bst.add(e: i)
    }
    var preStr = "前序遍历："
    bst.preorderTraversal { (e) in
        preStr.append("\(e), ")
    }
    print(preStr)
    
    var inStr = "中序遍历："
    bst.inorderTraversal { (e) in
        inStr.append("\(e), ")
    }
    print(inStr)
    
    var postStr = "后序遍历："
    bst.postorderTraversal { (e) in
        postStr.append("\(e), ")
    }
    print(postStr)
    
    var levelStr = "层序遍历："
    bst.levelOrderTraversal { (e) in
        levelStr.append("\(e), ")
    }
    print(levelStr)
    
    print("高度：", bst.heightOfIteration())
    print("高度：", bst.heigthOfRecursion())
    
    bst.printTree()
    
    print("是否为完全二叉树：", bst.isComplete())
    
    bst.invertBT()
    
    bst.printTree()
    
    print("是否为完全二叉树：", bst.isComplete())
}
