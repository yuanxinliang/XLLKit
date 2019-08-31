//
//  TimerController.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class TimerController: UIViewController {

    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        timer = Timer.scheduledTimer(timeInterval: 1, target: TimerTarget(self), selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerAction() {
        print(Date().xl.convertString())
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }

}
