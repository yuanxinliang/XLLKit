//
//  TimerTarget.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class TimerTarget: NSObject {
    
    weak var target: AnyObject?
    
    convenience init(_ target: AnyObject) {
        self.init()
        self.target = target
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return target
    }
    
    deinit {
        print("deinit - TimerTarget")
    }
    
}
