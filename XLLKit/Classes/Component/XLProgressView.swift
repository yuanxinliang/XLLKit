//
//  XLProgressView.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/3.
//

import UIKit
import MBProgressHUD

let xl_progressMinimumDuration: CGFloat = 2.0   // 默认最小显示时间
let xl_progressMaximumDuration: CGFloat = 10.0  // 默认最大显示时间

public class XLProgressView: UIView
{
    /// 显示等待指示器，N秒之后消失
    public class func xl_showIndicator(afterDelay: TimeInterval)
    {
        xl_showIndicator().hide(animated: true, afterDelay: afterDelay)
    }
    
    /// 显示等待指示器
    public class func xl_showIndicator() -> MBProgressHUD
    {
        return xl_showIndicator(message: nil, superview: nil)
    }
    
    /// 显示等待指示器和文字
    public class func xl_showIndicator(message: String?, superview: UIView?) -> MBProgressHUD
    {
        let view: UIView? = toView(toView: superview)
        let hud = MBProgressHUD.showAdded(to: view!, animated: true)
        if message?.count ?? 0 > 0 {
            hud.label.text = message
        }
        return hud
    }
    
    /// 显示文字
    public class func xl_showOnlyMessage(message: String)
    {
        xl_showOnlyMessage(message: message, superview: nil)
    }
    
    /// 显示文字
    public class func xl_showOnlyMessage(message: String, superview: UIView?)
    {
        let view: UIView? = toView(toView: superview)
        let hud = MBProgressHUD.showAdded(to: view!, animated: true)
        hud.mode = .text
        hud.label.text = message
        hud.label.numberOfLines = 0
        hud.hide(animated: true, afterDelay: TimeInterval(displayDurationForString(string: message)))
    }
    
    public class func test()
    {
        let hud = MBProgressHUD.showAdded(to: toView(toView: nil)!, animated: true)
        hud.mode = .text
        hud.label.text = "警告⚠️信息有机交付的对方觉机交付的对方觉机交"
        hud.label.numberOfLines = 0
        hud.detailsLabel.text = "信息有ffffff机交付的对方觉机交付的对方觉机交"
//        hud.margin = 30
//        hud.contentColor = .red
//        hud.backgroundColor = .yellow
//        hud.bezelView.backgroundColor = .orange
    }
    
    /// 返回视图，如果视图为 nil，则返回屏幕
    fileprivate class func toView(toView: UIView?) -> UIView?
    {
        var view: UIView? = toView
        if toView == nil {
            view = UIApplication.shared.windows.first
        }
        return view
    }
    
    /// 通过文字长度计算显示的时长
    fileprivate class func displayDurationForString(string: String) -> CGFloat
    {
        let minimum = max(CGFloat(string.count) * 0.06 + 0.5, xl_progressMinimumDuration)
        let duration = min(minimum, xl_progressMaximumDuration)
        return duration
    }
    
}
