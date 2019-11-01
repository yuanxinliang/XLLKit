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
        
        for i in (0..<array.count/2).reversed() {
            maxHeap(&array, array.count, i)
        }
        
        for i in (1..<array.count).reversed() {
            let temp = array[0]
            array[0] = array[i]
            array[i] = temp
            maxHeap(&array, i, 0)
        }
        
    }
    
    class func maxHeap(_ arr: inout [T], _ length: Int, _ index: Int) {
        var cur = index
        let half = length / 2
        while cur < half {
            let l = cur * 2 + 1
            let r = l + 1
            var max = l
            if r < length && arr[r] > arr[l] {
                max = r
            }
            if arr[max] < arr[cur] { break }
            let temp = arr[max]
            arr[max] = arr[cur]
            arr[cur] = temp
            cur = max
        }
    }
    
}
