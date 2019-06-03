//
//  AViewController.swift
//  PodTestDemo
//
//  Created by ZZCMXL on 2019/6/3.
//  Copyright © 2019 ZZCMXL. All rights reserved.
//

import UIKit
import XLLKit

class AViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = .red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
//        self.present(BViewController(), animated: true, completion: nil)
        print(XLTool.xl_getTopViewController() as Any)
    }
}
