//
//  TestNumberFormatController.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/6/16.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import XLLKit

class TestNumberFormatController: UIViewController, UITextFieldDelegate {

//    // 保存上一次的文本内容
//    var _previousText: String!
//
//    // 保持上一次的文本范围
//    var _previousRange: UITextRange!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        setupDefault()
        
        let phoneField = XLPhoneTextField(frame: CGRect(x:20, y:180, width:200, height:40))
        self.view.addSubview(phoneField)
    }
    
//    func setupDefault()
//    {
//        let phoneField = UITextField(frame: CGRect(x:20, y:180, width:200, height:30))
//        phoneField.borderStyle = .roundedRect
//        phoneField.keyboardType = .numberPad
//        phoneField.delegate = self
//        phoneField.addTarget(self, action: #selector(phoneNumberFormat(_:)), for: .editingChanged)
//        self.view.addSubview(phoneField)
//    }
    
//    /// 输入框内容改变时对其内容做格式化处理
//    @objc func phoneNumberFormat(_ textField: UITextField)
//    {
//        var cursorPostion = textField.offset(from: textField.beginningOfDocument, to: textField.selectedTextRange!.start)
//
//        let digitsText = getDigitsText(string: textField.text!, cursorPosition: &cursorPostion)
//
//        if digitsText.count > 11 {
//            textField.text = _previousText
//            textField.selectedTextRange = _previousRange
//            return
//        }
//
//        let hyphenText = getHyphenText(string: digitsText, cursorPosition: &cursorPostion)
//
//        textField.text = hyphenText
//
//        let targetPostion = textField.position(from: textField.beginningOfDocument, offset: cursorPostion)!
//        textField.selectedTextRange = textField.textRange(from: targetPostion, to: targetPostion)
//    }
//
//    /// 除去非数字字符，同时确定光标正确位置
//    func getDigitsText(string:String, cursorPosition:inout Int) -> String
//    {
//        //保存开始时光标的位置
//        let originalCursorPosition = cursorPosition
//        //处理后的结果字符串
//        var result = ""
//
//        var i = 0
//        //遍历每一个字符
//        for uni in string.unicodeScalars {
//            //如果是数字则添加到返回结果中
//            if CharacterSet.decimalDigits.contains(uni) {
//                result.append(string[i])
//            }
//                //非数字则跳过，如果这个非法字符在光标位置之前，则光标需要向前移动
//            else{
//                if i < originalCursorPosition {
//                    cursorPosition = cursorPosition - 1
//                }
//            }
//            i = i + 1
//        }
//
//        return result
//    }
//
//    /// 将分隔符插入现在的string中，同时确定光标正确位置
//    func getHyphenText(string:String, cursorPosition:inout Int) -> String
//    {
//        //保存开始时光标的位置
//        let originalCursorPosition = cursorPosition
//        //处理后的结果字符串
//        var result = ""
//
//        //遍历每一个字符
//        for i in 0  ..< string.count  {
//            //如果当前到了第4个、第8个数字，则先添加个分隔符
//            if i == 3 || i == 7 {
//                result.append(" ")
//                //如果添加分隔符位置在光标前面，光标则需向后移动一位
//                if i < originalCursorPosition {
//                    cursorPosition = cursorPosition + 1
//                }
//            }
//            result.append(string[i])
//        }
//
//        return result
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
//    {
//        //先保存输入框原先的值和选中范围
//        _previousText = textField.text!
//        _previousRange = textField.selectedTextRange!
//
//        //输入的第一个数字必需为1
//        if range.location == 0 {
//            if (string as NSString).intValue != 1 && string.count > 0 {
//                return false
//            }
//        }
//        return true
//    }

}


