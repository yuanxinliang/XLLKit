//
//  ViewController.swift
//  XLLKit
//
//  Created by yuanxinliang on 05/30/2019.
//  Copyright (c) 2019 yuanxinliang. All rights reserved.
//

import UIKit
import XLLKit
import Toast_Swift
import Then

class ViewController: UIViewController
{
    var titles = ["导航栏转场", "MBProgressHUD", "轮播图", "选择标签栏", "分页视图左右滑动", "城市选择", "单个选择", "手机号、银行卡号格式化", "饼状图", "textview 自适应高度"]
    var view1: UIView!
    
    var customView: UIView =
    {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
//    let tableView = UITableView().then { (tv) in
//
//    }
    
    let tableView: UITableView =
    {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.tableFooterView = UIView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        print(self)
        return tv
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        print(self)
//        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .orange
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        
//        print("09x_".xl_isMatch(regularString: "^[·•➋➌➍➎➏➐➑➒A-Za-z0-9\\u4E00-\\u9FA5]{1,30}$"))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
    
    }
    
    func testAnimation()
    {
        let animation = CATransition()
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        animation.type = CATransitionType.moveIn
        animation.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(animation, forKey: nil)
        //        navigationController?.navigationBar.isHidden = true
        let next = AViewController()
        navigationController?.pushViewController(next, animated: false)
    }
    
    func testAlertController()
    {
        self.present(AViewController(), animated: true, completion: nil)
        XLAlertController.xl_alertController(vc: self, title: "警告⚠️", message: "tishi", leftActionTitle: "cane", rightActionTitle: "ok", leftHandler: { (action) in
            print("123")
        }) { (action) in
            print("231")
        }
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

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.titles[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let animation = CATransition()
            animation.duration = 0.5
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
            animation.type = CATransitionType.moveIn
            animation.subtype = CATransitionSubtype.fromTop
            navigationController?.view.layer.add(animation, forKey: nil)
            let next = AViewController()
            navigationController?.pushViewController(next, animated: false)
        case 1:
            print("123")
//            XLProgressView.xl_showOnlyMessage(message: "警告⚠️警告")
//            XLProgressView.xl_showIndicator(message: "Loading...", superview: nil)
            let hud = XLProgressView.xl_showIndicator()
            hud.hide(animated: true, afterDelay: 3)
        case 2:
            print("123")
            self.navigationController?.pushViewController(TestCycleScrollViewController(), animated: true)
        case 3:
//            print("123")
            self.navigationController?.pushViewController(TestTabViewController(), animated: true)
        case 4:
            print("123")
            self.navigationController?.pushViewController(TestPageViewController(), animated: true)
        case 5:
            print("123")
            let view = XLCityPickerView()
            
            view.areaPickerViewWithareaBlock { (province, city, area) in
                print(province, city, area)
            }
            
        case 6:
            print("123")
            let data = ["1", "2", "3"]
            XLNormalSelectorView.showPickerView(dataSource: data, title: "选择", cancelBtnTitle: "取消", confirmBtnTitle: "确认", cancelClosure: {
                
            }) { (str) in
                print(str as Any)
            }
        case 7:
            self.navigationController?.pushViewController(TestNumberFormatController(), animated: true)
        case 8:
            self.navigationController?.pushViewController(TestPieViewController(), animated: true)
        case 9:
            self.navigationController?.pushViewController(TestTextViewAdjustFrameController(), animated: true)

        default:
            break
        }
    }
    
    
}

