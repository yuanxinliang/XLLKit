//
//  AppDelegate.swift
//  XLLKit
//
//  Created by yuanxinliang on 05/30/2019.
//  Copyright (c) 2019 yuanxinliang. All rights reserved.
//

import UIKit
import XLLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        test()
//        testQueue()
//        testLinkedList()
//        testBST()
        testLeetCode()
        
        let a = 3.15
        let a1 = ceil(a)  // 向下取整
        let a2 = floor(a) // 向上取整
        print(a1) // 4.0
        print(a2) // 3.0
        return true
    }
    
    
}

