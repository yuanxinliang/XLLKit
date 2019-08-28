//
//  UIImage+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/31.
//

extension UIImage: XLCompatible { }

// MARK: 图片设置圆角

public extension XL where Base: UIImage {
    
    func circleImage(cornerRadius: CGFloat) -> UIImage {
        return circleImage(roundingCorners: UIRectCorner.allCorners, cornerRadius: cornerRadius)
    }
    
    func circleImage(roundingCorners: UIRectCorner, cornerRadius: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(base.size, false, UIScreen.main.scale)
        
        let rect = CGRect(x: 0, y: 0, width: base.size.width, height: base.size.height)
        let bezier = UIBezierPath(roundedRect: rect, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(bezier.cgPath)
        context?.clip()
        
        base.draw(in: rect)
        context?.drawPath(using: .fillStroke)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
        
    }
    
    /// 圆形的图片
    func circleImage() -> UIImage {
        /*
         void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale);
         size: 同UIGraphicsBeginImageContext,参数size为新创建的位图上下文的大小
         opaque: 透明开关，如果图形完全不用透明，设置为YES以优化位图的存储。
         scale: 缩放因子
         */
        // 开启图形上下文
        UIGraphicsBeginImageContextWithOptions(base.size, false, UIScreen.main.scale)
        let rect = CGRect(x: 0, y: 0, width: base.size.width, height: base.size.height)
        let context = UIGraphicsGetCurrentContext()
        context?.addRect(rect)
        context?.clip()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
    static func circleImage(imageName: String) -> UIImage {
        return UIImage(named: imageName)?.xl.circleImage() ?? UIImage()
    }
    
}

// MARK: 根据颜色生成图片

public extension XL where Base: UIImage {
    
    static func createImage(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        // UIGraphicsBeginImageContext(size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
}

