//
//  AVLNode.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/27.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class AVLNode: TreeNode {
    
    /// 高度
    var height: Int = 1
    
    /// 平衡因子
    func balanceFactor() -> Int {
        let heights = childHights()
        return heights.0 - heights.1
    }
    
    /// 更新高度
    func updateHeight() {
        let heights = childHights()
        height = 1 + max(heights.0, heights.1)
    }
    
    /// 高度较大的子节点
    func tallerChildNode() -> AVLNode? {
        let heights = childHights()
        let leftHeight = heights.0, rightHeight = heights.1
        if leftHeight > rightHeight { return (left as? AVLNode) }
        if leftHeight < rightHeight { return (right as? AVLNode) }
        return isLeftChild ? (left as? AVLNode) : (right as? AVLNode)
    }
    
    private func childHights() -> (Int, Int) {
        var leftHeight = 0, rightHeight = 0
        if left != nil {
            leftHeight = (left as! AVLNode).height
        }
        if right != nil {
            rightHeight = (right as! AVLNode).height
        }
        return (leftHeight, rightHeight)
    }
}
