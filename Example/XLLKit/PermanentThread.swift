//
//  PermanentThread.swift
//  XLLKit_Example
//
//  Created by XL ZZCM on 2019/9/3.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

class XLThread: Thread {
    
}

public class PermanentThread: NSObject {
    
    var thread: Thread?
    var isStop: Bool = false
    var taskClosure: (() -> Void)?
    
    public override init() {
        super.init()
        begin()
    }
    
    public func executeTask(task: @escaping (() -> Void)) {
        
        guard thread != nil else {
            return
        }
        taskClosure = task
        perform(#selector(executeAction(_:)), on: thread!, with: task, waitUntilDone: false)
    }
    
    public func stop() {
        
        guard thread != nil else {
            return
        }
        perform(#selector(stopAction), on: thread!, with: nil, waitUntilDone: true)
    }
    
    fileprivate func begin() {
        thread = Thread(target: self, selector: #selector(keep), object: nil)
        thread?.start()
    }
    
    @objc fileprivate func keep() {
        print("线程开启")
        RunLoop.current.add(Port(), forMode: .default)
        while !isStop {
            RunLoop.current.run(mode: .default, before: Date.distantFuture)
        }
        print("线程结束")
    }
    
    @objc fileprivate func executeAction(_ task: @escaping (() -> Void)) {
        DispatchQueue.main.async {
            self.taskClosure!()
        }
    }
    
    @objc fileprivate func stopAction() {
        isStop = true
        thread = nil
    }
    
    deinit {
        stop()
    }
    
}
