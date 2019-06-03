//
//  XLTool.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/3.
//

import UIKit

public class XLTool: NSObject
{
    /// 拨打电话
    public class func xl_call(number: String)
    {
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
    public class func xl_jumpWeb(urlString: String)
    {
        if let url = URL(string: urlString) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    /// 获取最上层控制器
    public class func xl_getTopViewController() -> UIViewController?
    {
        guard let vc = UIApplication.shared.windows.first?.rootViewController else {
            return nil
        }
        return getTopViewController(vc: vc)
    }
    
    /// 从根控制器递归查找到顶层控制器
    fileprivate class func getTopViewController(vc: UIViewController) -> UIViewController
    {
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
}
