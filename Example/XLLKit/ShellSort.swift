//
//  ShellSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ShellSort<T: Comparable>: Sort<T> {
    
    override class func sort(arr: inout Array<T>) {
        print("shell sort")
        var step = arr.count/2
        while step > 0 {
            for i in step..<arr.count {
                insertion(&arr, step, i)
            }
            step /= 2
        }
    }
    
    class func insertion(_ arr: inout [T], _ step: Int, _ index: Int) {
        var cur = index
        let element = arr[index]
        while cur >= step && element < arr[cur - step] {
            arr[cur] = arr[cur - step]
            cur -= step
        }
        if cur != index {
            arr[cur] = element
        }
    }
    
}
