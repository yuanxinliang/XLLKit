//
//  BanirySearchTree.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class BanirySearchTree: BinaryTree {
    
    func add(e: Int) {
        
        // 如果是空树，先设置根节点
        if root == nil {
            root = TreeNode(e)
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
            } else {
                // 如果相等直接覆盖旧值，然后退出
                node!.element = e
                return
            }
        }
        
        let newNode = TreeNode(e, parent)
        
        if cmp > 0 {
            parent?.right = newNode
        } else {
            parent?.left = newNode
        }
        size += 1
    }
    
    func remove(elemet: Int) {
        
    }
    
    func contains(element: Int) -> Bool {
        return true
    }
    
}

func testBST() {
    let a = [10,8,14,4,9,12,15,2,5]
    let bst = BanirySearchTree()
    for i in a {
        bst.add(e: i)
    }
    
//    bst.preorderTraversal()
//    bst.inorderTraversal()
//    bst.postorderTraversal()
//    bst.levelOrderTraversal()
    
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
    
    
    print("-------------")
    print(bst)
}
