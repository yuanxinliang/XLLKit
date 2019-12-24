//
//  HeapSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class HeapSort<T: Comparable>: Sort<T> {
    
    override class func sort(arr: inout Array<T>) {
        print("heap sort")
        for i in (0..<arr.count/2).reversed() {
            maxHeap(&arr, arr.count, index: i)
        }
        
        for i in (1..<arr.count).reversed() {
            let temp = arr[0]
            arr[0] = arr[i]
            arr[i] = temp
            maxHeap(&arr, i, index: 0)
        }
        
    }
    
    class func maxHeap(_ arr: inout [T], _ lenght: Int, index: Int) {
        var cur = index
        let half = lenght / 2
        while cur < half {
            let l = cur * 2 + 1
            let r = l + 1
            var max = l
            if r < lenght && arr[r] > arr[l] {
                max = r
            }
            if arr[max] <= arr[cur] { break }
            let temp = arr[max]
            arr[max] = arr[cur]
            arr[cur] = temp
            cur = max
        }
    }
    
    
    
}
