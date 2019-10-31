//
//  HeapSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class HeapSort<T: Comparable>: Sort<T> {
    
    override class func sort(array: inout Array<T>) {
        print("heap sort")
        
        let count = array.count
        
        for i in (0...(count / 2 - 1)).reversed() {
            siftDown(&array, length: count, index: i)
        }
        
        for i in (1..<count).reversed() {
            let temp = array[0]
            array[0] = array[i]
            array[i] = temp
            siftDown(&array, length: i, index: 0)
        }
        
    }
    
    class func siftDown(_ array: inout [T], length: Int, index: Int) {
        
        var cur = index
        let half = length / 2
        while cur < half {
            let l = cur * 2 + 1
            let r = l + 1
            var max = l
            if r < length && array[r] > array[l] { max = r }
            if array[max] <= array[cur] { break }
            let temp = array[max]
            array[max] = array[cur]
            array[cur] = temp
            cur = max
        }
    }
}
