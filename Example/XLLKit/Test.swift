//
//  Test.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

// MARK: - RB 测试
func testRB() {
    let rb = RBTree()
        
    for i in 1...30 {
        rb.add(e: i)
    }
    rb.printTree()
}

// MARK: - AVL 测试

func testAVL() {
    testAVLDemo2()
}

func testAVLDemo2() {
    let avl = AVLTree()
    
    for i in 10...40 {
        avl.add(e: i)
//        avl.printTree()
//        print("------------")
    }
    avl.printTree()
    
//    for i in 0..<200 {
//        avl.remove(elemet: 200 - i)
//        avl.printTree()
//    }
}

func testAVLDemo1() {
    let tNode = TreeNode(1)
    let aNode = AVLNode(2)
    testAVL1(node: tNode)
    testAVL2(node: aNode)
    
    testAVL1(node: aNode) // 可以传入node类型子类的对象
//    testAVL2(node: tNode) // 不可以传入node类型父类的对象
    let a = aNode as TreeNode
    let b = a as! AVLNode
    testAVL2(node: b)
}

func testAVL1(node: TreeNode) { }
func testAVL2(node: AVLNode) {
    print(node)
}

// MARK: - BST 测试

func testBST() {
    let bst = BinarySearchTree()
    
    for i in 1...10 {
        bst.add(e: i)
    }
    
}

func testBST3() {
    let a = [10,8,14,4,9,12,15,2,5,11]
    let bst = BinarySearchTree()
    for i in a {
        bst.add(e: i)
    }
    
    bst.printTree()
    bst.remove(elemet: 15)
    bst.printTree()
}

func testBST2() {
    let a = [10,8,14,4,9,12,15,2,5,11]
    let bst = BinarySearchTree()
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
    let bst = BinarySearchTree()
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
