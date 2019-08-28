//
//  UIImageView+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

extension UIImageView: XLCompatible { }

// MARK: 设置图片圆角

public extension XL where Base: UIImageView {
    
    /// 创建视图
    static func createImageView(imageName: String) -> Base
    {
        let iv = Base.init(image: UIImage(named: imageName))
        return iv
    }
    
    func setCircleImage(cornerRadius: CGFloat) {
        setCircleImage(roundingCorners: .allCorners, cornerRadius: cornerRadius)
    }
    
    func setCircleImage(roundingCorners: UIRectCorner, cornerRadius: CGFloat) {
        if base.image != nil {
            base.image = base.image?.xl.circleImage(roundingCorners: roundingCorners, cornerRadius: cornerRadius)
        } else {
            print("iv 没有图片...")
        }
    }
}


