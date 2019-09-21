//
//  Leetcode.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/20.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation


class Solution {
    
    
    @discardableResult
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        if root == nil { return [] }
        
        var res: [[Int]] = []
        var nodes: [TreeNode] = [TreeNode]()
        nodes.append(root!)
        
        var height = 0
        var levelSize = 1
        
        while !nodes.isEmpty {
            
            let node = nodes.removeFirst()
            levelSize -= 1
            
            if res.count < (height + 1) {
                var array = [Int]()
                array.append(node.element)
                res.append(array)
            } else {
                var array = res[height]
                array.append(node.element)
                res[height] = array
            }
            
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
        
        //res.reverse()
        return res
    }
    
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        
        var levelSize = 1
        var maxWidth = 1
        
        // 层次遍历，模拟2个队列，一个用来存储每个层级的节点，一个用来存储对应节点的编号。
        // 节点编号从上到下，从0开始，规则：左子节点编号 = 父节点编号 * 2 + 1，右子节点编号 = 父节点编号 * 2 + 2；
        
        var nodes: [TreeNode] = [root!]
        var indeArr = [0]
        
        while !nodes.isEmpty {
            
            levelSize -= 1
            let node = nodes.removeFirst()
            let inde = indeArr.removeFirst()
            
            if node.left != nil {
                nodes.append(node.left!)
                indeArr.append(2 * inde + 1)
            }
            
            if node.right != nil {
                nodes.append(node.right!)
                indeArr.append(2 * inde + 2)
            }
            
            if levelSize == 0 {
                levelSize = nodes.count
                if indeArr.count > 0 {
                    let width = indeArr.last! - indeArr.first! + 1
                    if width > maxWidth {
                        maxWidth = width
                    }
                }
            }
            
        }
        
        return maxWidth
    }
    
    // MARK: - 98. 验证二叉搜索树
    var last: TreeNode?
    func isValidBST(_ root: TreeNode?) -> Bool {
        var valid: Bool = true
        inorderTraversal(root, &valid)
        return valid
    }

    func inorderTraversal(_ node: TreeNode?, _ valid: inout Bool) {

        if node == nil {
            return
        }

        inorderTraversal(node?.left, &valid)

        if last != nil && node!.element <= last!.element {
            valid = false
            return
        }
        last = node
        
        inorderTraversal(node?.right, &valid)
    }
}

func testLeetCode() {
    
    let a = [10,8,14,4,9,12,15,2,5]
    let bst = BanirySearchTree()
    for i in a {
        bst.add(e: i)
    }
    
//    let arr = Solution().levelOrder(bst.root)
//    print(arr)

//    let a2 = Solution().widthOfBinaryTree(bst.root)
//    print(a2)
    
    print(bst.width())
}
