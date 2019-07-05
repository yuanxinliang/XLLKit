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
        // Override point for customization after application launch.
//        let a = XLTool.xl_moneyFormatter(value: 10000.787777)
//        let b = XLTool.xl_dateConverToString(date: Date())
//        let c = XLTool.xl_dateConverToString(date: Date(), dateFormat: "yyyy/MM/dd")
//        let d = XLTool.xl_stringConverToDate(string: "2019-06-22 14:00:00")
//        let e = XLTool.xl_stringConverToDate(string: "2019-06-23", dateFormat: "yyyy/MM/dd")
//        print(a)
//        print(b)
//        print(c)
//        print(XLTool.xl_dateConverToString(date: d))
//        print(XLTool.xl_dateConverToString(date: e))
//        self.window?.backgroundColor = UIColor.xl_hex(0xeeeeee)
//        let a = moneyFormatter(money: 12345678.88)
//        let b = Int.max
//       let none = NumberFormatter.localizedString(from: NSNumber(value: 123456789), number: .decimal)
        return true
    }
    
    /// 金额格式化
    fileprivate func moneyFormatter(money: Float) -> String
    {
        let number = NSNumber(value: money)
        let formatter = NumberFormatter()
        // 设置显示样式
        formatter.numberStyle = .decimal
        // 设置小数点后最多2位
        formatter.maximumFractionDigits = 2
        // 设置小数点后最少2位（不足补0）
        formatter.minimumFractionDigits = 2
        // 自定义前缀
        formatter.positivePrefix = "￥"
        // 设置用组分隔
        formatter.usesGroupingSeparator = true
        // 分隔符号
        formatter.groupingSeparator = ","
        // 分隔位数
        formatter.groupingSize = 3
        // 格式化
        let format = formatter.string(from: number)
        return format ?? "￥0.00"
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

