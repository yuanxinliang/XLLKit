//
//  UITextField+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

public extension UITextField
{
    /// 创建文本输入框
    class func xl_createTextField(text: String?, textColor: UIColor?, textFont: UIFont?, placeholder: String?, placeholderColor: UIColor?, placeholderFont: UIFont?) -> Self
    {
        let tf = self.init()
        
        tf.text = text
        tf.textColor = textColor
        tf.font = textFont
        
        tf.placeholder = placeholder
        tf.setValue(placeholderColor, forKey: "_placeholderLabel.textColor")
        tf.setValue(placeholderFont, forKey: "_placeholderLabel.font")
        
        return tf
    }
    
    /// 输入框文本颜色、字体、占位符
    class func xl_createTextField(_ textColor: UIColor, _ textFont: UIFont, _ placeholder: String) -> Self
    {
        return xl_createTextField(text: nil, textColor: textColor, textFont: textFont, placeholder: placeholder, placeholderColor: nil, placeholderFont: nil)
    }
    
    /// 输入框文本颜色、字体、占位符、占位颜色、占位字体
    class func xl_createTextField(_ textColor: UIColor, _ textFont: UIFont, _ placeholder: String, _ placeholderColor: UIColor?, _ placeholderFont: UIFont?) -> Self
    {
        return xl_createTextField(text: nil, textColor: textColor, textFont: textFont, placeholder: placeholder, placeholderColor: placeholderColor, placeholderFont: placeholderFont)
    }
    
    /// 设置左边视图
    func xl_setLeftView(_ view: UIView)
    {
        xl_setLeftView(view, mode: .always)
    }
    
    /// 设置左边视图
    func xl_setLeftView(_ view: UIView, mode: UITextField.ViewMode)
    {
        self.leftView = view
        self.leftViewMode = mode
    }
    
    /// 设置右边视图
    func xl_setRightView(_ view: UIView)
    {
        xl_setRightView(view, mode: .always)
    }
    
    /// 设置右边视图
    func xl_setRightView(_ view: UIView, mode: UITextField.ViewMode)
    {
        self.rightView = view
        self.rightViewMode = mode
    }
    
    /// 设置删除按钮图片
    func xl_setClearButton(imageName: String, mode: UITextField.ViewMode)
    {
        let clearBtn = self.value(forKey: "_clearButton") as! UIButton
        clearBtn.setImage(UIImage(named: imageName), for: .normal)
        clearBtn.setImage(UIImage(named: imageName), for: .highlighted)
        self.clearButtonMode = mode
    }
    
    /// 设置占位字符属性
    func xl_setPlaceholder(color: UIColor?, font: UIFont)
    {
        self.setValue(color, forKey: "_placeholderLabel.textColor")
        self.setValue(font, forKey: "_placeholderLabel.font")
    }
}
