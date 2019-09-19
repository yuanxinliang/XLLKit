//
//  PermanentThreadController.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/3.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import XLLKit

class PermanentThreadController: UIViewController {
    
    var thread: PermanentThread?
    var tf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let beginBtn = UIButton(frame: CGRect(x: 20, y: 150, width: 150, height: 50))
        beginBtn.backgroundColor = .orange
        beginBtn.setTitle("开启常驻线程", for: .normal)
        beginBtn.addTarget(self, action: #selector(begin), for: .touchUpInside)
        view.addSubview(beginBtn)
        
        let endBtn = UIButton(frame: CGRect(x: 190, y: 150, width: 150, height: 50))
        endBtn.backgroundColor = .orange
        endBtn.setTitle("关闭常驻线程", for: .normal)
        endBtn.addTarget(self, action: #selector(end), for: .touchUpInside)
        view.addSubview(endBtn)
        
        let executeBtn = UIButton(frame: CGRect(x: 20, y: 220, width: 150, height: 50))
        executeBtn.backgroundColor = .orange
        executeBtn.setTitle("添加任务执行", for: .normal)
        executeBtn.addTarget(self, action: #selector(execute), for: .touchUpInside)
        view.addSubview(executeBtn)
        
        tf = UITextField(frame: CGRect(x: 190, y: 220, width: 150, height: 50))
        tf.textAlignment = .center
        tf.text = "1001"
        tf.backgroundColor = .orange
        view.addSubview(tf)
    }
    
    @objc func begin() {
        thread = PermanentThread()
    }
    
    @objc func end() {
        thread?.stop()
        thread = nil
    }
    
    @objc func execute() {
        thread?.executeTask(task: { [weak self] in
            print("执行任务：", self?.tf.text ?? "")
        })
    }

}
