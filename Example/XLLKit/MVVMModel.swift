//
//  MVVMModel.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class MVVMModel: NSObject {
    
    var title: String = ""
    var image: String = ""

    deinit {
        print("deinit - MVVMModel")
    }
}
