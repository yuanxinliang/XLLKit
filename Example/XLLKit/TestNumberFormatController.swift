//
//  TestNumberFormatController.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/6/16.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import XLLKit

class TestNumberFormatController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let phoneField = PhoneTextField(frame: CGRect(x:20, y:180, width:200, height:40))
        self.view.addSubview(phoneField)
    }

}


