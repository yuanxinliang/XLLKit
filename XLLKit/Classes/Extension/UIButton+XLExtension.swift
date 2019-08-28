//
//  UIButton+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

public var XLBtnDefaultTitleFont: UIFont = UIFont.systemFont(ofSize: 15)
public var XLBtnDefaultTitleColor: UIColor = .black
public var XLBtnDefaultBackgroundColor: UIColor = .white

extension UIButton: XLCompatible { }

public extension XL where Base: UIButton {
    
    func setFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
    {
        let frame = CGRect(x: x, y: y, width: width, height: height)
        base.frame = frame
    }
    
    static func createBtn(title: String) -> Base
    {
        return createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: XLBtnDefaultTitleColor, backgroundColor: XLBtnDefaultBackgroundColor)
    }
    
    static func createBtn(title: String, titleFont: UIFont) -> Base
    {
        return createBtn(title: title, titleFont: titleFont, titleColor: XLBtnDefaultTitleColor, backgroundColor: XLBtnDefaultBackgroundColor)
    }

    static func createBtn(title: String, titleColor: UIColor) -> Base
    {
        return createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: titleColor, backgroundColor: XLBtnDefaultBackgroundColor)
    }

    static func createBtn(title: String, backgroundColor: UIColor) -> Base
    {
        return createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: XLBtnDefaultTitleColor, backgroundColor: backgroundColor)
    }

    static func createBtn(title: String, titleFont: UIFont, titleColor: UIColor) -> Base
    {
        return createBtn(title: title, titleFont: titleFont, titleColor: titleColor, backgroundColor: XLBtnDefaultBackgroundColor)
    }

    static func createBtn(title: String, imageName: String) -> Base
    {
        return createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: XLBtnDefaultTitleColor, imageName: imageName)
    }

    static func createBtn(title: String, titleFont: UIFont, imageName: String) -> Base
    {
        return createBtn(title: title, titleFont: titleFont, titleColor: XLBtnDefaultTitleColor, imageName: imageName)
    }

    static func createBtn(title: String, titleColor: UIColor, imageName: String) -> Base
    {
        return createBtn(title: title, titleFont: XLBtnDefaultTitleFont, titleColor: titleColor, imageName: imageName)
    }

    static func createBtn(title: String?, titleFont: UIFont?, titleColor: UIColor?, backgroundColor: UIColor?) -> Base
    {
        let btn = Base.init()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = titleFont
        btn.setTitleColor(titleColor, for: .normal)
        btn.backgroundColor = backgroundColor
        return btn
    }
    
    static func createBtn(title: String?, titleFont: UIFont?, titleColor: UIColor?, imageName: String?) -> Base
    {
        let btn = Base.init()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = titleFont
        btn.setTitleColor(titleColor, for: .normal)
        btn.setImage(UIImage(named: imageName!), for: .normal)
        return btn
    }
}
