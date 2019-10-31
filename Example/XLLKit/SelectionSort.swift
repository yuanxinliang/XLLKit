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
        
        for i in (1..<array.count).reversed() {
            var max = 0
            for j in 1...i {
                if array[j] > array[max] {
                    max = j
                }
            }
            let temp = array[i]
            array[i] = array[max]
            array[max] = temp
        }
        
    }

}
