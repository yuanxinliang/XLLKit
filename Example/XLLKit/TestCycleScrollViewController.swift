//
//  TestCycleScrollViewController.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/5.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import XLLKit

class TestCycleScrollViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        let frame = CGRect(x: 0, y: 100, width: xl_screenWidth, height: 200)
//        let image = ["0"]
//        let image = ["0", "1"]
        let image = ["0", "1", "2", "3", "4"]
        let a = XLCycleScrollView.cycleScrollView(frame: frame, margin: 20, imageArray: image, needPageControl: true)
        a.backgroundColor = .orange
        view.addSubview(a)
//        a.imageArray = ["1", "2"]
    }

}
