//
//  UIColor+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

public extension UIColor
{
    /// 通过16进制字符串，设置颜，透明度为1.0
    class func xlHexString(hex: String) -> UIColor
    {
        return xlHexString(hex: hex, alpha: 1.0)
    }
    
    /// 通过16进制字符串、透明度，设置颜色
    class func xlHexString(hex: String, alpha: CGFloat) -> UIColor
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
        let redHex = (tempHex as NSString).substring(with: range)
        
        range.location = 2
        let greenHex = (tempHex as NSString).substring(with: range)
        
        range.location = 4
        let blueHex = (tempHex as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        
        Scanner.init(string: redHex).scanHexInt32(&r)
        Scanner.init(string: greenHex).scanHexInt32(&g)
        Scanner.init(string: blueHex).scanHexInt32(&b)
        
        return xlRGBA(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b), a: alpha)
    }
    
    /// 随机色
    class func xlRandomColor() -> UIColor
    {
        return xlRGB(r: CGFloat(arc4random() % 255),
                     g: CGFloat(arc4random() % 255),
                     b: CGFloat(arc4random() % 255))
    }
    
    /// 通过r、g、b设置颜色，透明度为1.0
    class func xlRGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor
    {
        return xlRGBA(r: r, g: g, b: b, a: 1.0)
    }
    
    /// 通过r、g、b、a设置颜色
    class func xlRGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor
    {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
}
