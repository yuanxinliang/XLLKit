//
//  GlobeConstant.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

import Foundation

// MARK: --<屏幕相关尺寸和宽高值>--

/// 屏幕宽度
public var xl_screenWidth: CGFloat
{
    return UIScreen.main.bounds.width
}

/// 屏幕高度
public var xl_screenHeight: CGFloat
{
    return UIScreen.main.bounds.height
}

/*
 
 width = 320, height = 480      640 x 960      3.5吋（iPhone 4S）
 width = 320, height = 568      640 x 1136     4.0吋（iPhone SE）
 width = 375, height = 667      750 x 1334     4.7吋（iPhone 8）
 width = 414, height = 736     1080 x 1920     5.5吋（iPhone 8 Plus）
 width = 375, height = 812     1125 x 2436     5.8吋（iPhone X、iPhone XS）
 width = 414, height = 896      828 x 1792     6.1吋（iPhone XR）
 width = 414, height = 896     1242 x 2688     6.5吋（iPhone XS Max）
 
 */

/// 3.5英寸屏幕
public var xl_iPhoneInch35: Bool
{
    return (xl_screenWidth == 320.0) && (xl_screenHeight == 480.0)
}

/// 4.0英寸屏幕
public var xl_iPhoneInch40: Bool
{
    return (xl_screenWidth == 320.0) && (xl_screenHeight == 568.0)
}

/// 4.7英寸屏幕
public var xl_iPhoneInch47: Bool
{
    return (xl_screenWidth == 375.0) && (xl_screenHeight == 667.0)
}

/// 5.5英寸屏幕
public var xl_iPhoneInch55: Bool
{
    return (xl_screenWidth == 414.0) && (xl_screenHeight == 736.0)
}

/// 5.8英寸屏幕
public var xl_iPhoneInch58: Bool
{
    return (xl_screenWidth == 375.0) && (xl_screenHeight == 812.0)
}

/// 6.1英寸屏幕
public var xl_iPhoneInch61: Bool
{
    return (xl_screenWidth == 414.0) && (xl_screenHeight == 896.0)
}

/// 6.5英寸屏幕
public var xl_iPhoneInch65: Bool
{
    return (xl_screenWidth == 414.0) && (xl_screenHeight == 896.0)
}

/// 是否全面屏
public var xl_iPhoneFullScreen: Bool
{
    return xl_iPhoneInch58 || xl_iPhoneInch61 || xl_iPhoneInch65
}

/// 宽度比例 -- 以375的宽度为基准
public var xl_widthScale: CGFloat
{
    return xl_screenWidth / 375.0
}

/// 高度比例 -- 以667的高度为基准
public var xl_heightScale: CGFloat
{
    return xl_screenHeight / 667.0
}

/// 状态栏高度
public var xl_statusBarHeight: CGFloat
{
    return xl_iPhoneFullScreen ? 44.0 : 20.0
}

/// 导航栏高度
public var xl_navigationBarHeight: CGFloat
{
    return xl_iPhoneFullScreen ? 88.0 : 64.0
}

/// 底部安全区域高度
public var xl_bottomSafeAeraHeight: CGFloat
{
    return xl_iPhoneFullScreen ? 34.0 : 0.0
}

/// 底部分栏高度
public var xl_tabBarHeight: CGFloat
{
    return xl_iPhoneFullScreen ? 83.0 : 49.0
}

/// 等比例计算宽度值
public func xl_w(_ w: CGFloat) -> CGFloat
{
    return (xl_widthScale < 1.0) ? (w * xl_widthScale) : w
}

/// 等比例计算高度值
public func xl_h(_ h: CGFloat) -> CGFloat
{
    return (xl_heightScale < 1.0) ? (h * xl_heightScale) : h
}

// MARK: --<App应用信息>--

/// APP 名称
public var xl_appName: String
{
    return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
}

/// APP 版本号
public var xl_appVersion: String
{
    return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
}

/// APP Build号
public var xl_appBuild: String
{
    return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
}

/// APP Bundle ID
public var xl_appBundleID: String
{
    return Bundle.main.bundleIdentifier!
}

// MARK: --<手机设备使用信息>--

// MARK: --<手机设备硬件、内存等信息>--

