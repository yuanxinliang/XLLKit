//
//  ShellSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ShellSort<T: Comparable>: Sort<T> {
    
    override class func sort(array: inout Array<T>) {
        print("shell sort")
        var step = array.count / 2
        while step > 0 {
            for i in step..<array.count {
                insertion(&array, step, i)
            }
            step /= 2
        }
    }
    
    class func insertion(_ array: inout [T], _ step: Int, _ index: Int) {
        var cur = index
        let element = array[index]
        while cur >= step && element < array[cur - step] {
            array[cur] = array[cur - step]
            cur -= step
        }
        if cur != index {
            array[cur] = element
        }
    }
    
    
}
