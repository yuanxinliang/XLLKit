//
//  ViewController.swift
//  XLLKit
//
//  Created by yuanxinliang on 05/30/2019.
//  Copyright (c) 2019 yuanxinliang. All rights reserved.
//

import UIKit
import XLLKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(xlAppName)
        print(xlAppBuild)
        print(xlAppVersion)
        print(xlAppBundleID)
        self.view.backgroundColor = UIColor.xlHexString(hex: "0x112340")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.backgroundColor = UIColor.xlRandomColor()
    }

}

