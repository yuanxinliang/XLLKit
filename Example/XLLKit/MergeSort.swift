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
        var preArray = [T]()
        sort(&preArray, &array, 0, array.count)
    }
    
    class func sort(_ preArray: inout [T], _ array: inout [T], _ left: Int, _ right: Int) {
        if right - left < 2 { return }
        let middle = (left + right) / 2
        sort(&preArray, &array, left, middle)
        sort(&preArray, &array, middle, right)
        merge(&preArray, &array, left, middle, right)
    }
    
    class func merge(_ preArray: inout [T], _ array: inout [T], _ left: Int, _ middle: Int, _ right: Int) {
        
        var lb = 0
        let le = middle - left
        
        var rb = middle
        let re = right
        
        var index = left
        
        preArray.removeAll()
        for i in 0..<le {
            preArray.append(array[left + i])
        }
        
        while lb < le {
            if rb < re && array[rb] < preArray[lb] {
                array[index] = array[rb]
                index += 1
                rb += 1
            } else {
                array[index] = preArray[lb]
                index += 1
                lb += 1
            }
        }
    }
}
