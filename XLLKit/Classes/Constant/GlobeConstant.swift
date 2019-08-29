//
//  GlobeConstant.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

import Foundation

// MARK: --<屏幕相关尺寸和宽高值>--

public struct Screen { }

extension Screen: XLCompatible { }

public extension XL where Base == Screen {
    
    /// 屏幕宽度
    static var width: CGFloat { return UIScreen.main.bounds.width }
    
    /// 屏幕高度
    static var height: CGFloat { return UIScreen.main.bounds.height }
    
    /*
     * width = 320, height = 480      640 x 960      3.5吋（iPhone 4S）
     * width = 320, height = 568      640 x 1136     4.0吋（iPhone SE）
     * width = 375, height = 667      750 x 1334     4.7吋（iPhone 8）
     * width = 414, height = 736     1080 x 1920     5.5吋（iPhone 8 Plus）
     * width = 375, height = 812     1125 x 2436     5.8吋（iPhone X、iPhone XS）
     * width = 414, height = 896      828 x 1792     6.1吋（iPhone XR）
     * width = 414, height = 896     1242 x 2688     6.5吋（iPhone XS Max）
     */
    
    /// 3.5英寸屏幕
    static var isInch_3_5: Bool { return width == 320 && height == 480 }
    
    /// 4.0英寸屏幕
    static var isInch_4_0: Bool { return width == 320 && height == 568 }
    
    /// 4.7英寸屏幕
    static var isInch_4_7: Bool { return width == 375 && height == 667 }
    
    /// 5.5英寸屏幕
    static var isInch_5_5: Bool { return width == 414 && height == 736 }
    
    /// 5.8英寸屏幕
    static var isInch_5_8: Bool { return width == 375 && height == 812 }
    
    /// 6.1英寸屏幕
    static var isInch_6_1: Bool { return width == 414 && height == 896 }
    
    /// 6.5英寸屏幕
    static var isInch_6_5: Bool { return width == 414 && height == 896 }
    
    /// 是否全面屏
    static var isFullScreen: Bool { return isInch_5_8 || isInch_6_1 || isInch_6_5 }
    
    /// 状态栏高度
    static var heightOfStatusBar: CGFloat { return isFullScreen ? 44 : 20 }
    
    /// 导航栏高度
    static var heightOfNavigationBar: CGFloat { return isFullScreen ? 88 : 64 }
    
    /// 底部安全区域高度
    static var heightOfBottomSafeAere: CGFloat { return isFullScreen ? 34 : 0 }
    
    /// 底部分栏高度
    static var heightOfTabBar: CGFloat { return isFullScreen ? 83 : 49 }
    
    /// 宽度比例 -- 以375的宽度为基准
    static var widthRatio: CGFloat { return width / 375.0 }
    
    /// 高度比例 -- 以667的高度为基准
    static var heightRatio: CGFloat { return height / 667.0 }
    
    /// 按比例计算宽度值：等比宽度
    static func w(_ width: CGFloat) -> CGFloat { return widthRatio < 1 ? (widthRatio * width) : width }
    
    /// 按比例计算高度值：等比高度
    static func h(_ height: CGFloat) -> CGFloat { return heightRatio < 1 ? (heightRatio * height) : height }
    
}

// MARK: --<App应用信息>--

public struct AppInfo { }

extension AppInfo: XLCompatible { }

public extension XL where Base == AppInfo {
    
    /// APP 名称
    static var name: String { return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String }
    
    /// APP 版本号
    static var version: String { return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String }
    
    /// APP Build号
    static var build: String { return Bundle.main.infoDictionary!["CFBundleVersion"] as! String }
    
    /// APP Bundle ID
    static var bundleID: String { return Bundle.main.bundleIdentifier! }
}

// MARK: --<手机设备使用信息>--

// MARK: --<手机设备硬件、内存等信息>--

