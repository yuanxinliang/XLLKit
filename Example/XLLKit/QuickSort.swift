//
//  QuickSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class QuickSort<T: Comparable>: Sort<T> {
    override class func sort(array: inout Array<T>) {
        print("quick sort")
        quickSort(&array, 0, array.count)
    }
    
    // [left, right) 闭区间和半闭区间
    class func quickSort(_ array: inout [T] , _ left: Int, _ right: Int) {
        if (right - left) < 2 { return } // 必须两个或以上的元素
        let middle = pivotInex(&array, left, right)
        quickSort(&array, left, middle)
        quickSort(&array, middle + 1, right)
    }
    
    class func pivotInex(_ array: inout [T] , _ left: Int, _ right: Int) -> Int {
        
        var begin = left
        var end = right
        
//        // 随机选择一个轴点元素
//        let index = begin + Int(arc4random()) % (right - left)
//        let temp = array[begin]
//        array[begin] = array[index]
//        array[index] = temp
//        let pivot = array[begin]
        
        let pivot = array[begin]
        
        end -= 1
        
        while begin < end {
            
            while begin < end {
                if array[end] > pivot {
                    end -= 1
                } else {
                    array[begin] = array[end]
                    begin += 1
                    break
                }
            }
            
            while begin < end {
                if array[begin] < pivot {
                    begin += 1
                } else {
                    array[end] = array[begin]
                    end -= 1
                    break
                }
            }
            
        }
        
        array[begin] = pivot
        
        return begin
    }
}
