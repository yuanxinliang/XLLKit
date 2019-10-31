//
//  SelectionSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class SelectionSort<T: Comparable>: Sort<T> {
    
    override class func sort(array: inout Array<T>) {
        print("selection sort")
        let count = array.count
        for i in (1..<count).reversed() {
            var max = 0
            for j in 1...i {
                if array[j] > array[max] {
                    max = j
                }
            }
            if max != i {
                let temp = array[max]
                array[max] = array[i]
                array[i] = temp
            }
        }
    }

}
