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
            var cur = i
            let value = array[i]
            while cur > 0 && value < array[cur - 1] {
                array[cur] = array[cur - 1]
                cur -= 1
            }
            if cur != i {
                array[cur] = value
            }
        }
    }
}
