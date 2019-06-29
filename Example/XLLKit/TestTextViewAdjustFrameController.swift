//
//  TestTextViewAdjustFrameController.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/29.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

// https://www.jianshu.com/p/32a4747a19fb
import UIKit

class TestTextViewAdjustFrameController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let w = self.view.bounds.width - 30
        let h: CGFloat = 100
        let frame = CGRect(x: 15, y: 100, width: w, height: h)
        let tv = UITextView(frame: frame)
        tv.font = UIFont.systemFont(ofSize: 20)
        tv.layer.borderColor = UIColor.black.cgColor
        tv.layer.borderWidth = 1.0
        tv.layoutManager.allowsNonContiguousLayout = false
        self.view.addSubview(tv)
        
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if parent != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(textViewAdjust(_:)), name: UITextView.textDidChangeNotification, object: nil)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    @objc func textViewAdjust(_ notification: Notification)
    {
        let textField = notification.object as! UITextView
    
        let string = textField.text!
        let w = textField.bounds.width
        let font = textField.font!
        let height = bk_height(string: string, width: w - 10, font: font)
        
        var frame = textField.frame
        if height > (100 - 16) {
            frame.size.height = height + 16
        } else {
            frame.size.height = 100
        }
        UIView.animate(withDuration: 0.1) {
            textField.frame = frame
        }
        
    }
    
    /// 根据固定宽度和字体，计算字符串的高度
    func bk_height(string: String, width: CGFloat, font: UIFont) -> CGFloat
    {
        let frame = (string as NSString).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        return frame.height
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

}
