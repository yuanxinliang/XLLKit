//
//  ViewController.swift
//  XLLKit
//
//  Created by yuanxinliang on 05/30/2019.
//  Copyright (c) 2019 yuanxinliang. All rights reserved.
//

import UIKit
import XLLKit

class ViewController: UIViewController , UITableViewDelegate{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.backgroundColor = UIColor.xl_randomColor()
        testAlertView()
    }
    
    func testAlertView()
    {
        XLAlertView.showAlertView(title: "警告⚠️", message: "密码格式错误", cancelTitle: "取消", confirmTitle: "确认", cancelClosure: {

        }) {

        }
//        XLAlertView.showAlertView(message: "警告⚠️警告⚠️警告⚠️警告⚠️警告⚠️警告⚠️")
    }
    
    func test01()
    {
        print("appppp".xl_bothNumberAndLetter())
    }
    
    func regularReplace()
    {
        let string = "ab-c=a0ZP"
        let pattern = "[a-z]"
        let replace = "k"
        do {
            let regular = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(location: 0, length: string.count)
            let str01 = regular.stringByReplacingMatches(in: string, options: [], range: range, withTemplate: replace)
            print(str01)
        } catch {
            print(error)
        }
        
        print(NSRegularExpression.xl_replacement(string: string, replace: replace, pattern: pattern))
    }
    
    func regularTest()
    {
        //        let phone = "13512341234"
        //        let tel = "17512344321"
        //        let code = "1234567"
        //        print(phone.xl_isPhoneNumber())
        //        print(phone.xl_isTelePhoneNumber())
        //        print(tel.xl_isPhoneNumber())
        //        print(tel.xl_isTelePhoneNumber())
        //        print(code.xl_isVericationCode())
        //        print(".".xl_isMatch(regularString: "^[\\.]+$"))
        //        print(".".xl_isMatch(regularString: "^\\w+$"))
        
        //        let string = ")))_00000"
        //        let pattern = "\\w+"
        //        do {
        //            let regular = try NSRegularExpression(pattern: pattern, options: [])
        //            let range = NSRange(location: 0, length: string.count)
        //            let result = regular.firstMatch(in: string, options: [], range: range)
        //            print(result?.resultType as Any)
        //            print(result?.regularExpression as Any)
        //            print(result?.range as Any)
        //        } catch {
        //
        //            print(error)
        //        }
        
        //        print("abcabaab ab".xl_isMatch(regularString: "ab"))
        
        //        let string = "abcabaab ab"
        //        let pattern = "\\bab\\b"
        //        do {
        //            let regular = try NSRegularExpression(pattern: pattern, options: [])
        //            let range = NSRange(location: 0, length: string.count)
        //            let result = regular.firstMatch(in: string, options: [], range: range)
        //            let reuslts = regular.matches(in: string, options: [], range: range)
        ////            print(result?.resultType as Any)
        ////            print(result?.regularExpression as Any)
        ////            print(result?.range as Any)
        ////            print(reuslts)
        //            for re in reuslts
        //            {
        //                print(re)
        //            }
        //        } catch {
        //
        //            print(error)
        //        }
        //        print("19..9uu9".xl_isMatch(regularString: "^(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{2,}"))
        print("1哈哈😆".xl_hasEmoji())
        print("1😁哈哈".xl_hasChinese())
    }
    
    func test()
    {
//        let text = "14511112222"
//        let pattern = "^(1)([3|5|7|8])([0-9]{9})"
//        let isMatch = NSRegularExpression.xl_isMatch(string: text, pattern: pattern, ignoreCase: false)
//        print(isMatch)
        
        print(xl_appName)
        print(xl_appBuild)
        print(xl_appVersion)
        print(xl_appBundleID)
        self.view.backgroundColor = UIColor.xl_hexString("0x112340")
        let a = UIImage().xl_circleImage()
        print(a)
        
        //        let a = UIView.xl_createView(backgroundColor: .yellow)
        //        a.frame = CGRect(x: 50, y: 200, width: 200, height: 200)
        //        self.view.addSubview(a)
        //        self.view.xl_setViewCornerRadius(roundingCorners: [.allCorners], cornerRadius: 100, color: .red)
        let text = "daljldkjfdlkajskldfjdklafjfajfdkljdlff!!!"
        let height = (text as NSString).boundingRect(with: CGSize(width: 200, height: 9999), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30)], context: nil).size.height
        let tv = UITextView(frame: CGRect(x: 20, y: 88, width: 200, height: height))
        // let size = tv.contentSize
        tv.text = text
        tv.isSelectable = false
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 30)
        tv.textContainerInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: -5);
        self.view.addSubview(tv)
        
        tv.layer.borderColor = UIColor.red.cgColor
        tv.layer.borderWidth = 1.0;
        
        let label = UILabel(frame: CGRect(x: 20, y: tv.frame.maxY + 20, width: 200, height: height))
        label.text = text
        label.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(label)
        
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 1.0;
        label.numberOfLines = 0
        
        print("test")
        XLBtnDefaultBackgroundColor = .gray
        XLBtnDefaultTitleColor = .orange
        let btn = UIButton.xl_createBtn(title: "button1")
        btn.xl_setFrame(x: 20, y: 100, width: 100, height: 50)
        self.view.addSubview(btn)
        btn.xl_setHorizontalGradientLayer(startColor: .red, endColor: .orange, cornerRadius: 25)
    }

    

}

