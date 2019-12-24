//
//  SelectionSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class SelectionSort<T: Comparable>: Sort<T> {
    
    override class func sort(arr: inout Array<T>) {
        print("selection sort")
        for i in (1..<arr.count).reversed() {
            var max = 0
            for j in 1...i {
                if arr[j] > arr[max] {
                    max = j
                }
            }
            let temp = arr[max]
            arr[max] = arr[i]
            arr[i] = temp
        }
    }

}
