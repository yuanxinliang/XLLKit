//
//  AVLTree.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class AVLTree: BanirySearchTree {
    
    override func createNode(_ element: Int, _ parent: TreeNode? = nil) -> TreeNode {
        return AVLNode(element, parent)
    }
    
    override func afterAdd(node: TreeNode) {
        var cur: TreeNode? = node.parent
        while cur != nil {
            if isBalanced(cur!) { // 如果是平衡，就更新一下高度
                updateHeight(cur!)
            } else { // 如果不平衡，需要恢复平衡
                reBalanceOfRotate(cur!)
                break
            }
            cur = cur?.parent
        }
    }
    
    override func afterRemove(node: TreeNode) {
        
    }
    
}

extension AVLTree {
    
    private func isBalanced(_ node: TreeNode) -> Bool {
        return abs((node as! AVLNode).balanceFactor()) <= 1 ? true : false
    }
    
    private func updateHeight(_ node: TreeNode) {
        (node as! AVLNode).updateHeight()
    }
}

extension AVLTree {
    
    // MARK: - 恢复平衡方法1
    
    /// 恢复平衡1
    private func reBalanceOfRotate(_ grand: TreeNode) {
        let parent = (grand as! AVLNode).tallerChildNode()
        let child = parent?.tallerChildNode()
        if parent?.isLeftChild ?? false {
            if child?.isLeftChild ?? false { // LL：grand 右旋
                rightRotate(grand)
            } else { // LR：parent 先左旋，grand 再右旋
                leftRotate(parent)
                rightRotate(grand)
            }
        } else {
            if child?.isRightChild ?? false { // RR：grand 左旋
                leftRotate(grand)
            } else { // RL：parent 先右旋，grand 再左旋
                rightRotate(parent)
                leftRotate(grand)
            }
        }
    }
    
    /// 左旋
    private func leftRotate(_ grand: TreeNode?) {
        let parent = grand?.right
        let child = parent?.left
        grand?.right = child
        parent?.left = grand
        afterRotate(grand, parent, child)
    }
    
    /// 右旋
    private func rightRotate(_ grand: TreeNode?) {
        let parent = grand?.left
        let child = parent?.right
        grand?.left = child
        parent?.right = grand
        afterRotate(grand, parent, child)
    }
    
    /// 旋转之后，处理父节点和高度
    private func afterRotate(_ grand: TreeNode?, _ parent: TreeNode?, _ child: TreeNode?) {
        
        // 处理各节点的父节点
        
        // 1.处理父节点的父节点
        if grand?.isLeftChild ?? false {
            grand?.parent?.left = parent
        } else if grand?.isRightChild ?? false {
            grand?.parent?.right = parent
        } else {
            root = parent
        }
        parent?.parent = grand?.parent
        
        if child != nil {
            // 2.处理子节点的父节点
            child?.parent = grand
        }
        
        // 3.先更新祖先节点的父节点
        grand?.parent = parent
        
        // 更新高度
        if grand != nil {
            updateHeight(grand!)
        }
        if parent != nil {
            updateHeight(parent!)
        }
    }
}

extension AVLTree {
    
    // MARK: - 恢复平衡方法2
    
    /// 恢复平衡2
    private func reBalance(_ grand: TreeNode) {
        let parent = (grand as! AVLNode).tallerChildNode()
        let child = parent?.tallerChildNode()
        if parent?.isLeftChild ?? false {
            if child?.isLeftChild ?? false { // LL：grand 右旋
                rotate(grand, child, child?.right, parent, parent?.right, grand)
            } else { // LR：parent 先左旋，grand 再右旋
                rotate(grand, parent, child?.left, child, child?.right, grand)
            }
        } else {
            if child?.isRightChild ?? false { // RR：grand 左旋
                rotate(grand, grand, parent?.left, parent, child?.left, child)
            } else { // RL：parent 先右旋，grand 再左旋
                rotate(grand, grand, child?.left, child, child?.right, parent)
            }
        }
    }
    
    private func rotate(_ r: TreeNode?,
                        _ b: TreeNode?,
                        _ c: TreeNode?,
                        _ d: TreeNode?,
                        _ e: TreeNode?,
                        _ f: TreeNode?) {
        
        
    }
    
}

// MARK: - 测试

func testAVL() {
    testAVLDemo2()
}

func testAVLDemo2() {
    let avl = AVLTree()
    
    for i in 1...15 {
        avl.add(e: i)
//        avl.printTree()
//        print("------------")
    }
    
    avl.printTree()
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
