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
        print("test")
        
    }
    
    func test()
    {
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
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.backgroundColor = UIColor.xl_randomColor()
    }

}

