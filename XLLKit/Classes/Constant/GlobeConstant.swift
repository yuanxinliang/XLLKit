//
//  GlobeConstant.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

import Foundation

// MARK: --<屏幕相关尺寸和宽高值>--

/// 屏幕宽度
public var xlScreenWidth: CGFloat
{
    return UIScreen.main.bounds.width
}

/// 屏幕高度
public var xlScreenHeight: CGFloat
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
public var xlIPhoneInch35: Bool
{
    return (xlScreenWidth == 320.0) && (xlScreenHeight == 480.0)
}

/// 4.0英寸屏幕
public var xlIPhoneInch40: Bool
{
    return (xlScreenWidth == 320.0) && (xlScreenHeight == 568.0)
}

/// 4.7英寸屏幕
public var xlIPhoneInch47: Bool
{
    return (xlScreenWidth == 375.0) && (xlScreenHeight == 667.0)
}

/// 5.5英寸屏幕
public var xlIPhoneInch55: Bool
{
    return (xlScreenWidth == 414.0) && (xlScreenHeight == 736.0)
}

/// 5.8英寸屏幕
public var xlIPhoneInch58: Bool
{
    return (xlScreenWidth == 375.0) && (xlScreenHeight == 812.0)
}

/// 6.1英寸屏幕
public var xlIPhoneInch61: Bool
{
    return (xlScreenWidth == 414.0) && (xlScreenHeight == 896.0)
}

/// 6.5英寸屏幕
public var xlIPhoneInch65: Bool
{
    return (xlScreenWidth == 414.0) && (xlScreenHeight == 896.0)
}

/// 是否全面屏
public var xlIPhoneFullScreen: Bool
{
    return xlIPhoneInch58 || xlIPhoneInch61 || xlIPhoneInch65
}

/// 宽度比例 -- 以375的宽度为基准
public var xlWidthScale: CGFloat
{
    return xlScreenWidth / 375.0
}

/// 高度比例 -- 以667的高度为基准
public var xlHeightScale: CGFloat
{
    return xlScreenHeight / 667.0
}

/// 状态栏高度
public var xlStatusBarHeight: CGFloat
{
    return xlIPhoneFullScreen ? 44.0 : 20.0
}

/// 导航栏高度
public var xlNavigationBarHeight: CGFloat
{
    return xlIPhoneFullScreen ? 88.0 : 64.0
}

/// 底部安全区域高度
public var xlBottomSafeAeraHeight: CGFloat
{
    return xlIPhoneFullScreen ? 34.0 : 0.0
}

/// 底部分栏高度
public var xlTabBarHeight: CGFloat
{
    return xlIPhoneFullScreen ? 83.0 : 49.0
}

/// 等比例计算宽度值
public func xlX(_ x: CGFloat) -> CGFloat
{
    return (xlWidthScale < 1.0) ? (x * xlWidthScale) : x
}

/// 等比例计算高度值
public func xlY(_ y: CGFloat) -> CGFloat
{
    return (xlHeightScale < 1.0) ? (y * xlHeightScale) : y
}

// MARK: --<App应用信息>--

/// APP 名称
public var xlAppName: String
{
    return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
}

/// APP 版本号
public var xlAppVersion: String
{
    return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
}

/// APP Build号
public var xlAppBuild: String
{
    return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
}

/// APP Bundle ID
public var xlAppBundleID: String
{
    return Bundle.main.bundleIdentifier!
}

// MARK: --<手机设备使用信息>--
// MARK: --<手机设备硬件信息>--

