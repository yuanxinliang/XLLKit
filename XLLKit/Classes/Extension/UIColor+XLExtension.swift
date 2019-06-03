//
//  UIColor+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

public extension UIColor
{
    /// 通过16进制值，设置颜色、透明度为1
    class func xl_hex(_ hex: Int) -> UIColor
    {
        return xl_hex(hex, 1.0)
    }
    
    /// 通过16进制值，设置颜色、透明度
    class func xl_hex(_ hex: Int, _ alpha: CGFloat) -> UIColor
    {
        let r: Int = (hex & 0xFF0000) >> 16
        let g: Int = (hex & 0x00FF00) >> 8
        let b: Int = (hex & 0x0000FF)
        return xl_RGBA(CGFloat(r), CGFloat(g), CGFloat(b), alpha)
    }
    
    /// 通过16进制字符串，设置颜色，透明度为1.0
    class func xl_hexString(_ hex: String) -> UIColor
    {
        return xl_hexString(hex, 1.0)
    }
    
    /// 通过16进制字符串、透明度，设置颜色
    class func xl_hexString(_ hex: String, _ alpha: CGFloat) -> UIColor
    {
        var tempHex = hex
        
        if tempHex.count < 6 {
            print("十六进制字符串错误.")
            return UIColor.white
        }
        
        if tempHex.hasPrefix("0x") {
            tempHex = tempHex.replacingOccurrences(of: "0x", with: "")
        }
        
        if tempHex.hasPrefix("#") {
            tempHex = tempHex.replacingOccurrences(of: "#", with: "")
        }
        
        if tempHex.count != 6 {
            print("十六进制字符串错误.")
            return UIColor.white
        }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rHex = (tempHex as NSString).substring(with: range)
        
        range.location = 2
        let gHex = (tempHex as NSString).substring(with: range)
        
        range.location = 4
        let bHex = (tempHex as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        
        Scanner.init(string: rHex).scanHexInt32(&r)
        Scanner.init(string: gHex).scanHexInt32(&g)
        Scanner.init(string: bHex).scanHexInt32(&b)
        
        return xl_RGBA(CGFloat(r), CGFloat(g), CGFloat(b), alpha)
    }
    
    /// 随机色
    class func xl_randomColor() -> UIColor
    {
        return xl_RGB(CGFloat(arc4random() % 255), CGFloat(arc4random() % 255), CGFloat(arc4random() % 255))
    }
    
    /// 通过r、g、b设置颜色，透明度为1.0
    class func xl_RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor
    {
        return xl_RGBA(r, g, b, 1.0)
    }
    
    /// 通过r、g、b、a设置颜色
    class func xl_RGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor
    {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
}
