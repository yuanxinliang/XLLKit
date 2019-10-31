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
    
    class func quickSort(_ array: inout [T], _ left: Int, _ right: Int) {
        if right - left < 2 { return }
        let middle = pivotIndex(&array, left, right)
        quickSort(&array, left, middle)
        quickSort(&array, middle + 1, right)
    }
    
    class func pivotIndex(_ array: inout [T], _ left: Int, _ right: Int) -> Int {
        var begin = left
        var end = right - 1
        let pivot = array[begin]
        while begin < end {
            while begin < end {
                if pivot < array[end] {
                    end -= 1
                } else {
                    array[begin] = array[end]
                    begin += 1
                    break
                }
            }
            
            while begin < end {
                if pivot > array[begin] {
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
