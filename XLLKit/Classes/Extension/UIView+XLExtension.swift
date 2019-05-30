//
//  UIView+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

// MARK: Frame设置

public extension UIView
{
    
    var xl_x: CGFloat
    {
        get {
            return frame.origin.x
        }
        set {
            var f = frame
            f.origin.x = newValue
            frame = f
        }
    }
    
    var xl_y: CGFloat
    {
        get {
            return frame.origin.y
        }
        set {
            var f = frame
            f.origin.y = newValue
            frame = f
        }
    }
    
    var xl_width: CGFloat
    {
        get {
            return frame.size.width
        }
        set {
            var f = frame
            f.size.width = newValue
            frame = f
        }
    }
    
    var xl_height: CGFloat
    {
        get {
            return frame.size.height
        }
        set {
            var f = frame
            f.size.height = newValue
            frame = f
        }
    }
    
    var xl_origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            var f = frame
            f.origin = newValue
            frame = f
        }
    }
    
    var xl_size: CGSize {
        get {
            return frame.size
        }
        set {
            var f = frame
            f.size = newValue
            frame = f
        }
    }
    
    var xl_centerX: CGFloat {
        get {
            return center.x
        }
        set {
            var c = center
            c.x = newValue
            center = c
        }
    }
    
    var xl_centerY: CGFloat {
        get {
            return center.y
        }
        set {
            var c = center
            c.y = newValue
            center = c
        }
    }
    
    var xl_bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            xl_y = newValue - xl_height
        }
    }
    
}

// MARK: 属性设置

public extension UIView
{
    
}
