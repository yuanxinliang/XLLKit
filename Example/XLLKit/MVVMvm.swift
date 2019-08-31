//
//  MVVMvm.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class MVVMvm: NSObject {
    
    weak var controller: UIViewController!
    
    @objc dynamic var title: String = ""
    @objc dynamic var image: String = ""
    
    convenience init(_ viewController: UIViewController) {
        self.init()
        controller = viewController
        
        let view = MVVMView(frame: CGRect(x: 100, y: 150, width: 100, height: 140))
        view.delegate = self
        view.vm = self
        view.setupObserver()
        
        controller.view.addSubview(view)
        
        let model = MVVMModel()
        model.title = "计算"
        model.image = "book"
        
        DispatchQueue.main.async {
            self.title = model.title
            self.image = model.image
        }
    }
    
    deinit {
        print("deinit - MVVMvm")
    }
}

extension MVVMvm: MVVMViewDelegate {
    
    func mvvmViewDidClick(_ view: MVVMView) {
        print("点击来了...")
    }
}
