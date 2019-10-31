//
//  QuickSort.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class QuickSort<T: Comparable>: Sort<T> {
    override class func sort(array: inout Array<T>) {
        print("quick sort")
    }
}
