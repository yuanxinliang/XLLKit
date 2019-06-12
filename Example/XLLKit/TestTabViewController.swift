//
//  TestTabViewController.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import XLLKit

class TestTabViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let a = TestCategoryView(frame: CGRect(x: 0, y: 200, width: xl_screenWidth, height: 30))
        a.backgroundColor = .cyan
        self.view.addSubview(a)
    }

}
