//
//  MVPController.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class MVPController: UIViewController {

    var presenter: MVPPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter = MVPPresenter(self)
    }

}
