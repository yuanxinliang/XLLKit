//
//  BViewController.swift
//  PodTestDemo
//
//  Created by ZZCMXL on 2019/6/3.
//  Copyright © 2019 ZZCMXL. All rights reserved.
//

import UIKit
import XLLKit

class BViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print(XLTool.xl_getTopViewController() as Any)
    }

}
