//
//  GCDTimerController.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class GCDTimerController: UIViewController {
    
    var timer: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        _ = GCDTimer.timer(interval: 1, start: 1, repeat: true) {
//            print(Date())
//        }
        
        timer = GCDTimer.timer(interval: 1, start: 2, target: TimerTarget(self), selector: #selector(log1), repeat: true)
    }
    
    @objc func log1() {
        print(Date())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        GCDTimer.cancelTimer(timer)
    }
    
    deinit {
        print("deinit - GCDTimerController")
        GCDTimer.cancelTimer(timer)
    }
}
