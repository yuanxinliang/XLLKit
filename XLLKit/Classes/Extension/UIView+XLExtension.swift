//
//  UIView+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

// MARK: 读取Frame值

public extension UIView
{
    
    var xl_x: CGFloat
    {
        get {
            return frame.origin.x
        }
        set {
            var f = frame
            f.origin.x = newValue
            frame = f
        }
    }
    
    var xl_y: CGFloat
    {
        get {
            return frame.origin.y
        }
        set {
            var f = frame
            f.origin.y = newValue
            frame = f
        }
    }
    
    var xl_width: CGFloat
    {
        get {
            return frame.size.width
        }
        set {
            var f = frame
            f.size.width = newValue
            frame = f
        }
    }
    
    var xl_height: CGFloat
    {
        get {
            return frame.size.height
        }
        set {
            var f = frame
            f.size.height = newValue
            frame = f
        }
    }
    
    var xl_origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            var f = frame
            f.origin = newValue
            frame = f
        }
    }
    
    var xl_size: CGSize {
        get {
            return frame.size
        }
        set {
            var f = frame
            f.size = newValue
            frame = f
        }
    }
    
    var xl_centerX: CGFloat {
        get {
            return center.x
        }
        set {
            var c = center
            c.x = newValue
            center = c
        }
    }
    
    var xl_centerY: CGFloat {
        get {
            return center.y
        }
        set {
            var c = center
            c.y = newValue
            center = c
        }
    }
    
    var xl_bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            xl_y = newValue - xl_height
        }
    }
    
}

// MARK: 创建视图

public extension UIView
{
    class func xl_createView(backgroundColor: UIColor) -> Self
    {
        let view = self.init()
        view.backgroundColor = backgroundColor
        return view
    }
}

// MARK: 设置视图

public extension UIView
{
    /// 颜色水平渐变
    func xl_setHorizontalGradientLayer(startColor: UIColor, endColor: UIColor)
    {
        xl_setHorizontalGradientLayer(startColor: startColor, endColor: endColor, cornerRadius: 0.0)
    }
    
    /// 颜色水平渐变
    func xl_setHorizontalGradientLayer(startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat)
    {
        xl_setGradientLayer(horizontal: true, vertical: false, startColor: startColor, endColor: endColor, cornerRadius: cornerRadius)
    }
    
    /// 颜色垂直渐变
    func xl_setVerticalGradientLayer(startColor: UIColor, endColor: UIColor)
    {
        xl_setVerticalGradientLayer(startColor: startColor, endColor: endColor, cornerRadius: 0.0)
    }
    
    /// 颜色垂直渐变
    func xl_setVerticalGradientLayer(startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat)
    {
        xl_setGradientLayer(horizontal: false, vertical: true, startColor: startColor, endColor: endColor, cornerRadius: cornerRadius)
    }
    
    /// 颜色在水平或垂直方向上渐变
    func xl_setGradientLayer(horizontal: Bool, vertical: Bool,startColor: UIColor, endColor: UIColor, cornerRadius: CGFloat)
    {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        
        if horizontal {
            gradient.endPoint = CGPoint(x: 1, y: 0)
        }
        if vertical {
            gradient.endPoint = CGPoint(x: 0, y: 1)
        }
        
        if cornerRadius > 0.0 {
            gradient.cornerRadius = cornerRadius
        }
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /// 添加阴影效果
    func xl_setShadow(shadowColor: UIColor, shadowOpacity: CGFloat, shadowOffset: CGSize, shadowRadius: CGFloat, conerRadius: CGFloat)
    {
        xl_setShadowAndBorder(shadowColor: shadowColor, shadowOpacity: shadowOpacity, shadowOffset: shadowOffset, shadowRadius: shadowRadius, borderColor: nil, borderWidth: nil, conerRadius: conerRadius)
    }
    
    /// 添加边框效果
    func xl_setBorder(borderColor: UIColor, borderWidth: CGFloat, conerRadius: CGFloat)
    {
        xl_setShadowAndBorder(shadowColor: nil, shadowOpacity: nil, shadowOffset: nil, shadowRadius: nil, borderColor: borderColor, borderWidth: borderWidth, conerRadius: conerRadius)
    }
    
    /// 添加阴影和边框效果
    func xl_setShadowAndBorder(shadowColor: UIColor?, shadowOpacity: CGFloat?, shadowOffset: CGSize?, shadowRadius: CGFloat?, borderColor: UIColor?, borderWidth: CGFloat?, conerRadius: CGFloat?)
    {
        if shadowColor != nil {
            self.layer.shadowColor = shadowColor!.cgColor
        }
        
        if (shadowOpacity ?? 0.0) > 0.0 {
            self.layer.shadowOpacity = Float(shadowOpacity!)
        }
        
        if shadowOffset != nil {
            self.layer.shadowOffset = shadowOffset!
        }
        
        if (shadowRadius ?? 0.0) > 0.0 {
            self.layer.shadowRadius = shadowRadius!
        }
        
        if borderColor != nil {
            self.layer.borderColor = borderColor?.cgColor
        }
        
        if (borderWidth ?? 0.0) > 0.0  {
            self.layer.borderWidth = borderWidth!
        }
        
        if (conerRadius ?? 0.0) > 0.0 {
            self.layer.cornerRadius = conerRadius!
        }
        
    }
}

// MARK: 设置圆角

public extension UIView
{
    /// 第一种方式：性能最差-设置layer
    func xl_setViewCornerRadius(cornerRadius: CGFloat)
    {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    /// 第二种方式：性能中-设置mask
    func xl_setViewCornerRadius(roundingCorners: UIRectCorner, cornerRadius: CGFloat)
    {
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
    
    /// 第三种方式：性能最优-通过给视图添加iv的方式。iv里面放了image
    func xl_setViewCornerRadius(roundingCorners: UIRectCorner, cornerRadius: CGFloat, color: UIColor?)
    {
        let imageView = UIImageView(frame: bounds)
        let image = UIImage.xl_createImage(color: color ?? UIColor.white, size: bounds.size)
        imageView.image = image.xl_circleImage(roundingCorners: roundingCorners, cornerRadius: cornerRadius)
        insertSubview(imageView, at: 0)
    }
}

// MARK: 获取当前控制器

public extension UIView
{
    /// 通过视图响应者链条获取视图的当前控制器
    var xl_viewController : UIViewController?
    {
        get
        {
            return xl_getCurrentViewController()
        }
    }
    
    fileprivate func xl_getCurrentViewController() -> UIViewController?
    {
        var nextRes: UIResponder? = self
        repeat {
            nextRes = nextRes?.next
            if let vc = (nextRes as? UIViewController) {
                return vc
            }
        } while nextRes != nil
        return nil
    }
}
