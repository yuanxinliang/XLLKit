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
        print("2019-01-01 12:11:23".xl.convertDate())
        print("qwer".xl[1])
        print("qwer"[1])
        print("13211111111".xl.isPhoneNumber())
        print("132111111112".xl.isPhoneNumber())
        
        print(Screen.xl.isInch_5_8)
        print(Screen.xl.height)
        print(Screen.xl.width)
        
        print(AppInfo.xl.name)
        print(AppInfo.xl.version)
        print(AppInfo.xl.build)
        print(AppInfo.xl.bundleID)
        return true
    }


}

