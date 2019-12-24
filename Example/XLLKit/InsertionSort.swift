//
//  InsertionSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class InsertionSort<T: Comparable>: Sort<T> {
    override class func sort(arr: inout Array<T>) {
        print("insertion sort")
        for i in 1..<arr.count {
            var cur = i
            let element = arr[i]
            while cur > 0 && element < arr[cur - 1] {
                arr[cur] = arr[cur - 1]
                cur -= 1
            }
            if cur != i {
                arr[cur] = element
            }
        }
    }
}
