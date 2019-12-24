//
//  QuickSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class QuickSort<T: Comparable>: Sort<T> {
    
    override class func sort(arr: inout Array<T>) {
        print("quick sort")
        sort(&arr, 0, arr.count)
    }
    
    class func sort(_ arr: inout [T], _ left: Int, _ right: Int) {
        if right - left < 2 { return }
        let middle = pivotIndex(&arr, left, right)
        sort(&arr, left, middle)
        sort(&arr, middle + 1, right)
    }
    
    class func pivotIndex(_ arr: inout [T], _ left: Int, _ right: Int) -> Int {
        
        var begin = left
        var end = right - 1
        let pivot = arr[left]
        while begin < end {
            while begin < end {
                if pivot < arr[end] {
                    end -= 1
                } else {
                    arr[begin] = arr[end]
                    begin += 1
                    break
                }
            }
            while begin < end {
                if pivot > arr[begin] {
                    begin += 1
                } else {
                    arr[end] = arr[begin]
                    end -= 1
                    break
                }
            }
        }
        arr[begin] = pivot
        return begin
    }
    
}
