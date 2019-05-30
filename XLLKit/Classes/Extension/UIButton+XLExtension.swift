//
//  UIButton+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

public extension UIButton
{
    class func xl_createBtn(title: String, titleColor: UIColor, titleFont: UIFont) -> Self
    {
        let btn = self.init()
        return btn
    }
    
    convenience init(title: String, imageName: String)
    {
        self.init()
    }
}
