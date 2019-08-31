//
//  GCDTimer.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
import Foundation

var timers: [String : DispatchSourceTimer] = [:]
var semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)

public class GCDTimer {
    
    
    
    public class func timer(interval: TimeInterval,
                            start: TimeInterval,
                            repeat: Bool,
                            task: @escaping () -> Void) -> String {
        
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer.schedule(deadline: .now() + start, repeating: DispatchTimeInterval.seconds(Int(interval)), leeway: .nanoseconds(0))
        
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        let name = String(format: "%zd", timers.count)
        timers[name] = timer
        semaphore.signal()
        
        timer.setEventHandler {
            task()
            if `repeat` == false {
                cancelTimer(name)
            }
        }
        timer.resume()
        return name
    }
    
    public class func timer(interval: TimeInterval,
                            start: TimeInterval,
                            target: AnyObject,
                            selector: Selector,
                            repeat: Bool) -> String {
        let name = timer(interval: interval, start: start, repeat: `repeat`) {
            _ = target.perform(selector)
        }
        return name
    }
    
    public class func cancelTimer(_ timerName: String) {
        
        guard timerName.count != 0 else {
            return
        }
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        let timer = timers[timerName]
        if timer != nil {
            timer?.cancel()
            timers.removeValue(forKey: timerName)
        }
        semaphore.signal()
    }
    
    
}
