//
//  UILabel+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

public var XLLabelDefaultAlignment: NSTextAlignment = .left
public var XLLabelDefaultNumberOfLines: Int = 1
public var XLLabelDefaultBackgroundColor: UIColor = .white

extension UILabel: XLCompatible { }

public extension XL where Base: UILabel {
    
    /// 创建文本：内容、颜色、字体
    static func createLabel(_ text: String, _ textColor: UIColor, _ textFont: UIFont) -> Base
    {
        return createLabel(text, textColor, textFont, XLLabelDefaultAlignment, XLLabelDefaultNumberOfLines, XLLabelDefaultBackgroundColor)
    }
    
    /// 创建文本：内容、颜色、字体、对齐方式
    static func createLabel(_ text: String, _ textColor: UIColor, _ textFont: UIFont, _ textAlignment: NSTextAlignment) -> Base
    {
        return createLabel(text, textColor, textFont, textAlignment, XLLabelDefaultNumberOfLines, XLLabelDefaultBackgroundColor)
    }
    
    /// 创建文本：内容、颜色、字体、行数
    static func createLabel(_ text: String, _ textColor: UIColor, _ textFont: UIFont, _ numberOfLines: Int) -> Base
    {
        return createLabel(text, textColor, textFont, XLLabelDefaultAlignment, numberOfLines, XLLabelDefaultBackgroundColor)
    }
    
    /// 创建文本：内容、颜色、字体、背景颜色
    static func createLabel(_ text: String, _ textColor: UIColor, _ textFont: UIFont, _ backgroundColor: UIColor) -> Base
    {
        return createLabel(text, textColor, textFont, XLLabelDefaultAlignment, XLLabelDefaultNumberOfLines, backgroundColor)
    }
    
    /// 创建文本：内容、颜色、字体、对齐方式、行数
    static func createLabel(_ text: String, _ textColor: UIColor, _ textFont: UIFont, _ textAlignment: NSTextAlignment, _ numberOfLines: Int) -> Base
    {
        return createLabel(text, textColor, textFont, textAlignment, numberOfLines, XLLabelDefaultBackgroundColor)
    }
    
    /// 创建Label
    ///
    /// - Parameters:
    ///   - text: 文本内容
    ///   - textColor: 文本颜色
    ///   - textFont: 文本字体
    ///   - textAlignment: 文本对齐方式
    ///   - numberOfLines: 文本行数
    ///   - backgroundColor: 文本背景颜色
    static func createLabel(_ text: String, _ textColor: UIColor, _ textFont: UIFont, _ textAlignment: NSTextAlignment, _ numberOfLines: Int, _ backgroundColor: UIColor) -> Base
    {
        let label = Base.init()
        label.text = text
        label.textColor = textColor
        label.font = textFont
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.backgroundColor = backgroundColor
        return label
    }
}
