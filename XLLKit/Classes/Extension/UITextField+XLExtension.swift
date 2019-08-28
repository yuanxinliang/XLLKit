//
//  UITextField+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

extension UITextField: XLCompatible { }

public extension XL where Base: UITextField {
    
    /// 创建文本输入框
    static func createTextField(text: String?, textColor: UIColor?, textFont: UIFont?, placeholder: String?, placeholderColor: UIColor?, placeholderFont: UIFont?) -> Base
    {
        let tf = Base.init()
        
        tf.text = text
        tf.textColor = textColor
        tf.font = textFont
        
        tf.placeholder = placeholder
        tf.setValue(placeholderColor, forKey: "_placeholderLabel.textColor")
        tf.setValue(placeholderFont, forKey: "_placeholderLabel.font")
        
        return tf
    }
    
    /// 输入框文本颜色、字体、占位符
    static func createTextField(_ textColor: UIColor, _ textFont: UIFont, _ placeholder: String) -> Base
    {
        return createTextField(text: nil, textColor: textColor, textFont: textFont, placeholder: placeholder, placeholderColor: nil, placeholderFont: nil)
    }
    
    /// 输入框文本颜色、字体、占位符、占位颜色、占位字体
    static func createTextField(_ textColor: UIColor, _ textFont: UIFont, _ placeholder: String, _ placeholderColor: UIColor?, _ placeholderFont: UIFont?) -> Base
    {
        return createTextField(text: nil, textColor: textColor, textFont: textFont, placeholder: placeholder, placeholderColor: placeholderColor, placeholderFont: placeholderFont)
    }
    
    /// 设置左边视图
    func setLeftView(_ view: UIView)
    {
        setLeftView(view, mode: .always)
    }
    
    /// 设置左边视图
    func setLeftView(_ view: UIView, mode: UITextField.ViewMode)
    {
        base.leftView = view
        base.leftViewMode = mode
    }
    
    /// 设置右边视图
    func setRightView(_ view: UIView)
    {
        setRightView(view, mode: .always)
    }
    
    /// 设置右边视图
    func setRightView(_ view: UIView, mode: UITextField.ViewMode)
    {
        base.rightView = view
        base.rightViewMode = mode
    }
    
    /// 设置删除按钮图片
    func setClearButton(imageName: String, mode: UITextField.ViewMode)
    {
        let clearBtn = base.value(forKey: "_clearButton") as! UIButton
        clearBtn.setImage(UIImage(named: imageName), for: .normal)
        clearBtn.setImage(UIImage(named: imageName), for: .highlighted)
        base.clearButtonMode = mode
    }
    
    /// 设置占位字符属性
    func setPlaceholder(color: UIColor?, font: UIFont)
    {
        base.setValue(color, forKey: "_placeholderLabel.textColor")
        base.setValue(font, forKey: "_placeholderLabel.font")
    }
}
