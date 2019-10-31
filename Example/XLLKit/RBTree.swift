//
//  RBTree.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class RBTree: BalanceBinarySearchTree {
    
    /// 创建节点
    override func createNode(_ element: Int, _ parent: TreeNode? = nil) -> TreeNode {
        return RBNode(element, parent)
    }
    
    /// 更新节点颜色状态
    @discardableResult
    private func updateColor(_ node: TreeNode?, _ color: Bool) -> TreeNode? {
        if node == nil { return node }
        (node as! RBNode).color = color
        return node
    }
    /// 更新节点红色
    @discardableResult
    private func red(_ node: TreeNode?) -> TreeNode? {
        updateColor(node, RED)
    }
    /// 更新节点黑色
    @discardableResult
    private func black(_ node: TreeNode?) -> TreeNode? {
        updateColor(node, BLACK)
    }
    
    /// 获取节点颜色状态
    private func colorOf(_ node: TreeNode?) -> Bool {
        return node == nil ? BLACK : (node as! RBNode).color
    }
    /// 是否为红色节点
    private func isRed(_ node: TreeNode?) -> Bool {
        return colorOf(node) == RED
    }
    /// 是否为黑色节点
    private func isBlack(_ node: TreeNode?) -> Bool {
        return colorOf(node) == BLACK
    }
    
    override func afterAdd(_ node: TreeNode) {
        
        let parent: TreeNode? = node.parent
        // 添加的节点是根节点或者上溢到了根节点
        if parent == nil {
            black(node)
            return
        }
        
        // 调整节点一种有12种情况
        
        // 第一种类型(四种情况)：父节点是黑色节点，直接返回，（不做任何操作）
        if isBlack(parent) { return }
        
        // 叔父节点
        let uncle = parent?.sibling
        // 祖父节点
        let grand = parent?.parent
        
        // 第二种类型(四种情况)：叔父节点是红色节点 - 更新节点颜色
        if isRed(uncle) {
            black(parent)
            black(uncle)
            red(grand)
            // 把祖父节点当做是新添加的节点
            if grand != nil {
                afterAdd(grand!)
            }
            return
        }
        
        // 第三种类型(四种情况)：叔父节点不是红色节点 - 旋转操作
        if parent?.isLeftChild ?? false {
            if node.isLeftChild { // LL
                black(parent)
                red(grand)
                rightRotate(grand)
            } else { // LR
                black(node)
                red(grand)
                leftRotate(grand)
                rightRotate(parent)
            }
        } else {
            if node.isLeftChild { // RL
                black(node)
                red(grand)
                rightRotate(parent)
                leftRotate(grand)
            } else { // RR
                black(parent)
                red(grand)
                leftRotate(grand)
            }
        }
    }
    
    override func afterRemove(_ node: TreeNode) {
        // 如果删除的节点是红色或者用以取代删掉节点的子节点是红色
        if isRed(node) {
            black(node)
            return
        }
        let parent = node.parent
        // 删除的是根节点
        if parent == nil { return }
        
        // 删除的是黑色叶子节点「下溢」
        // 判断被删除的 node 是左还是右
        let left = parent?.left == nil || node.isLeftChild
        var sibling = left ? parent?.right : parent?.left
        if left { // 被删除的节点在左边，兄弟节点在右边
            if isRed(sibling) { // 兄弟节点是红色
                black(sibling)
                red(parent)
                leftRotate(parent)
                // 更换兄弟
                sibling = parent?.right
            }
            // 兄弟节点必然是黑色
            if isBlack(sibling?.left) && isBlack(sibling?.right) {
                // 兄弟节点没有一个红色子节点，父节点要向下跟兄弟节点合并
                let parentBlack = isBlack(parent)
                black(parent)
                red(sibling)
                if parentBlack && parent != nil {
                    afterRemove(parent!)
                }
            } else { // 兄弟节点至少有一个红色子节点，向兄弟节点借元素
                // 兄弟节点的左边是黑色，兄弟要先旋转
                if isBlack(sibling?.right) {
                    rightRotate(sibling)
                    sibling = parent?.right
                }
                updateColor(sibling, colorOf(parent))
                black(sibling?.right)
                black(parent)
                leftRotate(parent)
            }
        } else { // 被删除的节点在右边，兄弟节点在左边
            if isRed(sibling) { // 兄弟节点是红色
                black(sibling)
                red(parent)
                rightRotate(parent)
                // 更换兄弟
                sibling = parent?.left
            }
            // 兄弟节点必然是黑色
            if isBlack(sibling?.left) && isBlack(sibling?.right) {
                // 兄弟节点没有一个红色子节点，父节点要向下跟兄弟节点合并
                let parentBlack = isBlack(parent)
                black(parent)
                red(sibling)
                if parentBlack && parent != nil {
                    afterRemove(parent!)
                }
            } else { // 兄弟节点至少有一个红色子节点，向兄弟节点借元素
                // 兄弟节点的左边是黑色，兄弟要先旋转
                if isBlack(sibling?.left) {
                    leftRotate(sibling)
                    sibling = parent?.left
                }
                updateColor(sibling, colorOf(parent))
                black(sibling?.left)
                black(parent)
                rightRotate(parent)
            }
        }
        
    }
    
}
