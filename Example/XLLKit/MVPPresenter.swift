//
//  MVPPresenter.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class MVPPresenter: NSObject {
    
    weak var controller: UIViewController!
    
    convenience init(_ viewController: UIViewController) {
        self.init()
        controller = viewController
        
        let view = MVPView(frame: CGRect(x: 100, y: 150, width: 100, height: 140))
        view.delegate = self
        controller.view.addSubview(view)
        
        let model = MVPModel()
        model.title = "日历"
        model.image = "calendar"
        
        view.setData(model.title, model.image)
    }
}

extension MVPPresenter: MVPViewDelegate {
    
    func mvpViewDidClick(_ view: MVPView) {
        print("点击来了...")
    }
}
