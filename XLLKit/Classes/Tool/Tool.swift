//
//  Tool.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/3.
//

import UIKit
import StoreKit

public class Tool { }

extension Tool: XLCompatible { }

public extension XL where Base: Tool {
    
    /// 去评分
    static func toScore(idString: String) {
        
        let urlString = "itms-apps://itunes.apple.com/app/id\(idString)?action=write-review"
        
        if let url = URL(string: urlString) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
        //        let urlString = "itms-apps://itunes.apple.com/app/id1474192596?action=write-review"
        //        if #available(iOS 10.3, *) {
        //            SKStoreReviewController.requestReview()
        //        } else {
        //            let str = "itms-apps://itunes.apple.com/app/id\(idString)?action=write-review"
        //            UIApplication.shared.openURL(URL(string: str)!)
        //        }
        
    }
    
    /// 拨打电话
    static func call(number: String) {
        let urlString = "tel://\(number)"
        if let url = URL(string: urlString) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    /// 跳转webview
    static func jumpWeb(urlString: String) {
        if let url = URL(string: urlString) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    /// 获取最上层控制器
    static func getTopViewController() -> UIViewController? {
        guard let vc = UIApplication.shared.windows.first?.rootViewController else {
            return nil
        }
        return getTopViewController(vc: vc)
    }
    
    /// 从根控制器递归查找到顶层控制器
    fileprivate static func getTopViewController(vc: UIViewController) -> UIViewController {
        if vc.isKind(of: UITabBarController.self) {
            return getTopViewController(vc: (vc as! UITabBarController).selectedViewController!)
        } else if vc.isKind(of: UINavigationController.self) {
            return getTopViewController(vc: (vc as! UINavigationController).visibleViewController!)
        } else if vc.presentedViewController != nil {
            return getTopViewController(vc: vc.presentedViewController!)
        } else {
            return vc
        }
    }
    
    /// 金额格式化 - http://www.hangge.com/blog/cache/detail_2086.html
    static func moneyFormatter(value: Double) -> String {
        let number = NSNumber(value: value)
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
    
    /// 时间转换：date -> string - http://www.hangge.com/blog/cache/detail_2182.html
    static func dateConverToString(date: Date, dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let str = formatter.string(from: date)
        return str
    }
    
    /// 时间转换：string -> date
    static func stringConverToDate(string: String, dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: string)
        return date!
    }
}
