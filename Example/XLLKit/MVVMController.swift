//
//  MVVMController.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class MVVMController: UIViewController {

    var vm: MVVMvm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        vm = MVVMvm(self)
    }
    
    deinit {
        print("deinit - MVVMController")
    }

}
