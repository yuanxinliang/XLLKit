//
//  InsertionSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class InsertionSort<T: Comparable>: Sort<T> {
    override class func sort(array: inout Array<T>) {
        print("insertion sort")
        for i in 1..<array.count {
            var j = i
            var cur = array[j]
            while j > 0 && cur < array[j - 1] {
                array[j] = array[j - 1]
                j -= 1
            }
            array[j] = cur
        }
    }
}
