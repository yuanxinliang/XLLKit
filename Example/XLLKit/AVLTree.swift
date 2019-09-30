//
//  AVLTree.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class AVLTree: BalanceBinarySearchTree {
    
    override func createNode(_ element: Int, _ parent: TreeNode? = nil) -> TreeNode {
        return AVLNode(element, parent)
    }
    
    override func afterAdd(_ node: TreeNode) {
        var cur: TreeNode? = node.parent
        while cur != nil {
            if isBalanced(cur!) { // 如果是平衡，就更新一下高度
                updateHeight(cur!)
            } else { // 如果不平衡，需要恢复平衡
//                reBalanceOfRotate(cur!)
                reBalance(cur!)
                break
            }
            cur = cur?.parent
        }
    }
    
    override func afterRemove(_ node: TreeNode) {
        var cur: TreeNode? = node.parent
        while cur != nil {
            if isBalanced(cur!) { // 如果是平衡，就更新一下高度
                updateHeight(cur!)
            } else { // 如果不平衡，需要恢复平衡
                reBalanceOfRotate(cur!)
//                reBalance(cur!)
            }
            cur = cur?.parent
        }
    }
    
    override func afterRotate(_ grand: TreeNode?, _ parent: TreeNode?, _ child: TreeNode?) {
        super.afterRotate(grand, parent, child)
        // 更新高度
        if grand != nil {
            updateHeight(grand!)
        }
        if parent != nil {
            updateHeight(parent!)
        }
    }
    
    override func rotate(_ r: TreeNode?, _ a: TreeNode?, _ b: TreeNode?, _ c: TreeNode?, _ d: TreeNode?, _ e: TreeNode?, _ f: TreeNode?, _ g: TreeNode?) {
        super.rotate(r, a, b, c, d, e, f, g)
        // 更新高度
        updateHeight(b!)
        updateHeight(f!)
        updateHeight(d!)
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
    
    // MARK: - 恢复平衡方法2
    
    /// 恢复平衡2
    private func reBalance(_ grand: TreeNode) {
        let parent = (grand as! AVLNode).tallerChildNode()
        let child = parent?.tallerChildNode()
        if parent?.isLeftChild ?? false {
            if child?.isLeftChild ?? false { // LL：grand 右旋
                rotate(grand, child?.left, child, child?.right, parent, parent?.right, grand, grand.right)
            } else { // LR：parent 先左旋，grand 再右旋
                rotate(grand, parent?.left, parent, child?.left, child, child?.right, grand, grand.right)
            }
        } else {
            if child?.isRightChild ?? false { // RR：grand 左旋
                rotate(grand, grand.left, grand, parent?.left, parent, child?.left, child, child?.right)
            } else { // RL：parent 先右旋，grand 再左旋
                rotate(grand, grand.left, grand, child?.left, child, child?.right, parent, parent?.right)
            }
        }
    }
    
}


