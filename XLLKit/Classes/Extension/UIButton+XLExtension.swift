//
//  UIButton+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

public var XLBtnDefaultTitleFont: UIFont = UIFont.systemFont(ofSize: 15)
public var XLBtnDefaultTitleColor: UIColor = .black
public var XLBtnDefaultBackgroundColor: UIColor = .white

public extension UIButton
{
    func xl_setFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
    {
        let frame = CGRect(x: x, y: y, width: width, height: height)
        self.frame = frame
    }
    
    class func xl_createBtn(title: String) -> Self
    {
        return xl_createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: XLBtnDefaultTitleColor, backgroundColor: XLBtnDefaultBackgroundColor)
    }
    
    class func xl_createBtn(title: String, titleFont: UIFont) -> Self
    {
        return xl_createBtn(title: title, titleFont: titleFont, titleColor: XLBtnDefaultTitleColor, backgroundColor: XLBtnDefaultBackgroundColor)
    }
    
    class func xl_createBtn(title: String, titleColor: UIColor) -> Self
    {
        return xl_createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: titleColor, backgroundColor: XLBtnDefaultBackgroundColor)
    }
    
    class func xl_createBtn(title: String, backgroundColor: UIColor) -> Self
    {
        return xl_createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: XLBtnDefaultTitleColor, backgroundColor: backgroundColor)
    }
    
    class func xl_createBtn(title: String, titleFont: UIFont, titleColor: UIColor) -> Self
    {
        return xl_createBtn(title: title, titleFont: titleFont, titleColor: titleColor, backgroundColor: XLBtnDefaultBackgroundColor)
    }
    
    class func xl_createBtn(title: String, imageName: String) -> Self
    {
        return xl_createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: XLBtnDefaultTitleColor, imageName: imageName)
    }
    
    class func xl_createBtn(title: String, titleFont: UIFont, imageName: String) -> Self
    {
        return xl_createBtn(title: title, titleFont: titleFont, titleColor: XLBtnDefaultTitleColor, imageName: imageName)
    }
    
    class func xl_createBtn(title: String, titleColor: UIColor, imageName: String) -> Self
    {
        return xl_createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: titleColor, imageName: imageName)
    }

    class func xl_createBtn(title: String?, titleFont: UIFont?, titleColor: UIColor?, backgroundColor: UIColor?) -> Self
    {
        let btn = self.init()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = titleFont
        btn.setTitleColor(titleColor, for: .normal)
        btn.backgroundColor = backgroundColor
        return btn
    }
    
    class func xl_createBtn(title: String?, titleFont: UIFont?, titleColor: UIColor?, imageName: String?) -> Self
    {
        let btn = self.init()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = titleFont
        btn.setTitleColor(titleColor, for: .normal)
        btn.setImage(UIImage(named: imageName!), for: .normal)
        return btn
    }
}
