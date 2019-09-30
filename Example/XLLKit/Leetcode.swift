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
    
    // MARK: - 450. 删除二叉搜索树中的节点
    /*
     * 1.先根据元素查找节点，
     * 2.再删除节点
     */
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        // 1.先根据元素查找节点，
        var node = root
        var parent: TreeNode? = nil
        while node != nil {
            let cmp = key - (node?.element ?? 0)
            if cmp == 0 {
                break
            } else if cmp < 0 {
                parent = node
                node = node?.left
            } else {
                parent = node
                node = node?.right
            }
        }
        if node == nil { return root } // 没有找到节点就直接返回根节点
        
        // 2.再删除节点
        
        if node?.left != nil && node?.right != nil { // 两个子节点
            let pre = predecessor(root, key)
            node?.element = pre?.element ?? 0
            parent = node
            node = pre
        }
        
        let replaceNode = node?.left != nil ? node?.left : node?.right
        
        if replaceNode != nil { // 一个子节点
            
            if node === root {
                node = replaceNode
                return node
            } else if node === parent?.left {
                parent?.left = replaceNode
            } else {
                parent?.right = replaceNode
            }
            
        } else { // 叶子节点
            if node === root {
                node = nil
                return nil
            } else {
                if node === parent?.left {
                    parent?.left = nil
                } else {
                    parent?.right = nil
                }
            }
        }
        
        return root
    }
    
    var pre: TreeNode? = nil
    
    func predecessor(_ node: TreeNode?, _ key: Int) -> TreeNode? {
        predecessorCompletion(node, key)
        return pre
    }
    
    func predecessorCompletion(_ node: TreeNode?, _ key: Int) {
        
        if node == nil { return}
        
        predecessorCompletion(node?.left, key)
        print(node?.element ?? 0)
        if node?.element ?? 0 <= key {
//            pre = node
        } else {
            if pre == nil {
                pre = node
            }
            print("-------")
            return
        }
        predecessorCompletion(node?.right, key)
        
        
    }
    
    // MARK: - 108. 将有序数组转换为二叉搜索树
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        let a = recursion(nums, 0, nums.count - 1)
        return a
    }

    func recursion(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {

        if left > right {
            return nil
        }

        let middle = (left + right) / 2

        let root = TreeNode(nums[middle])

        root.left = recursion(nums, left, middle - 1)
        
        root.right = recursion(nums, middle + 1, right)
        
        return root
    }
    
    // MARK: - 2. 两数相加
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var arr1 = [Int]()
        var arr2 = [Int]()
        var arr = [Int]()
        
        var node1 = l1
        var node2 = l2
        
        while node1 != nil {
            arr1.append(node1!.val)
            node1 = node1?.next
        }
        
        while node2 != nil {
            arr2.append(node2!.val)
            node2 = node2?.next
        }
        
        var add = 0
        
        while !arr1.isEmpty || !arr2.isEmpty || add > 0 {
            
            var a = 0
            if !arr1.isEmpty {
                a = arr1.removeFirst()
            }
            var b = 0
            if !arr2.isEmpty {
                b = arr2.removeFirst()
            }
            var sum = a + b + add
            if sum > 10 {
                add = sum / 10
                sum = sum % 10
            }
            arr.append(sum)
            
        }
        
        let node = ListNode(0)
        var cur = node
        while !arr.isEmpty {
            let n = ListNode(arr.removeFirst())
            cur.next = n
            cur = n
        }
        
        return node.next
    }
}

func testLeetCode() {
    
    let a = [10,8,14,4,9,12,15,2,5,11]
    let bst = BinarySearchTree()
    for i in a {
        bst.add(e: i)
    }
    
//    let arr = Solution().levelOrder(bst.root)
//    print(arr)

//    let a2 = Solution().widthOfBinaryTree(bst.root)
//    print(a2)
    
//    print(bst.width())
//    bst.printTree()
//    bst.root = Solution().deleteNode(bst.root, 10)
//    bst.printTree()
    bst.root = Solution().sortedArrayToBST([-10,-3,0,5,9])
    bst.printTree()
}
