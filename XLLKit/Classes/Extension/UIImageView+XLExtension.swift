//
//  UIImageView+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//


// MARK: 创建视图

public extension UIImageView
{
    class func xl_createImageView(imageName: String) -> Self
    {
        let iv = self.init(image: UIImage(named: imageName))
        return iv
    }
}

// MARK: 设置图片圆角

public extension UIImageView
{
    func xl_setCircleImage(cornerRadius: CGFloat)
    {
        xl_setCircleImage(roundingCorners: .allCorners, cornerRadius: cornerRadius)
    }
    
    func xl_setCircleImage(roundingCorners: UIRectCorner, cornerRadius: CGFloat)
    {
        if image != nil {
            image = image?.xl_circleImage(roundingCorners: roundingCorners, cornerRadius: cornerRadius)
        } else {
            print("iv 没有图片...")
        }
    }
}
