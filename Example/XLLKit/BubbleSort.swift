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
    override class func sort(arr: inout Array<T>) {
        print("bubble sort")
        for i in (1..<arr.count).reversed() {
            var flag = false
            for j in 1...i {
                if arr[j - 1] > arr[j] {
                    let temp = arr[j - 1]
                    arr[j - 1] = arr[j]
                    arr[j] = temp
                    flag = true
                }
            }
            if !flag { break }
        }
    }
}
