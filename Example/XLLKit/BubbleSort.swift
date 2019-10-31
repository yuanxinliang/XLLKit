//
//  BubbleSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

/*
 继承泛型类
 例如有如下的泛型类：
 class Box<T> {

 }
 有如下的两种继承方式：
 class Gift<T>: Box<T> {
 }

 class StringBox: Box<String> {
 }
 */

class BubbleSort<T: Comparable>: Sort<T> {
    override class func sort(array: inout Array<T>) {
        print("bubble sort")
        
        let count = array.count
        for i in (1..<count).reversed() {
            var flag = false
            for j in 1...i {
                if array[j - 1] > array[j] {
                    let temp = array[j - 1]
                    array[j - 1] = array[j]
                    array[j] = temp
                    flag = true
                }
            }
            if !flag { break }
        }
    }
}
