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
        sort(&array, 0, array.count)
    }
    
    class func sort(_ arr: inout [T], _ left: Int, _ right: Int) {
        if right - left < 2 {
            return
        }
        let middle = pivotInex(&arr, left, right)
        sort(&arr, left, middle)
        sort(&arr, middle + 1, right)
    }
    
    class func pivotInex(_ arr: inout [T], _ left: Int, _ right: Int) -> Int {
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
