//
//  MergeSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class MergeSort<T: Comparable>: Sort<T> {
    
    override class func sort(array: inout Array<T>) {
        print("merge sort")
        var pre = [T]()
        sort(&pre, &array, 0, array.count)
    }
    
    class func sort(_ pre: inout [T], _ arr: inout [T], _ left: Int, _ right: Int) {
        if right - left < 2 { return }
        let middle = (left + right) / 2
        sort(&pre, &arr, left, middle)
        sort(&pre, &arr, middle, right)
        merge(&pre, &arr, left, middle, right)
    }
    
    class func merge(_ pre: inout [T], _ arr: inout [T], _ left: Int, _ middle: Int, _ right: Int) {
        
        var lb = 0
        let le = middle - left
        
        var rb = middle
        let re = right
        
        pre.removeAll()
        for i in 0..<le {
            pre.append(arr[left + i])
        }
        
        var index = left
        
        while lb < le {
            if rb < re && arr[rb] < pre[lb] {
                arr[index] = arr[rb]
                index += 1
                rb += 1
            } else {
                arr[index] = pre[lb]
                index += 1
                lb += 1
            }
        }
    }
    
    
    
}
