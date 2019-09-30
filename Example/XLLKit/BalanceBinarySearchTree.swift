//
//  BalanceBinarySearchTree.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

/// 平衡二叉搜索树

class BalanceBinarySearchTree: BinarySearchTree {
    
    /// 左旋
    func leftRotate(_ grand: TreeNode?) {
        let parent = grand?.right
        let child = parent?.left
        grand?.right = child
        parent?.left = grand
        afterRotate(grand, parent, child)
    }
    
    /// 右旋
    func rightRotate(_ grand: TreeNode?) {
        let parent = grand?.left
        let child = parent?.right
        grand?.left = child
        parent?.right = grand
        afterRotate(grand, parent, child)
    }
    
    /// 旋转之后，处理父节点和高度
    func afterRotate(_ grand: TreeNode?, _ parent: TreeNode?, _ child: TreeNode?) {
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
    }
    
    func rotate(_ r: TreeNode?,
                _ a: TreeNode?, _ b: TreeNode?, _ c: TreeNode?,
                _ d: TreeNode?,
                _ e: TreeNode?, _ f: TreeNode?, _ g: TreeNode?) {
        
        // 先处理最顶上节点的指向
        d?.parent = r?.parent
        if r?.isLeftChild ?? false {
            r?.parent?.left = d
        } else if r?.isRightChild ?? false {
            r?.parent?.right = d
        } else {
            root = d
        }
        
        // 处理左子树
        b?.left = a
        b?.right = c
        a?.parent = b
        c?.parent = b
        
        // 处理右子树
        f?.left = e
        f?.right = g
        e?.parent = f
        g?.parent = f
        
        // 处理父节点
        d?.left = b
        d?.right = f
        b?.parent = d
        f?.parent = d
    }
    
}
