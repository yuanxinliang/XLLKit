//
//  XLCycleScrollView.swift
//  XLLKit
//
//  Created by XL Yuen on 2019/6/4.
//

import UIKit
import SDWebImage

/// 轮播图
let timerInterval = 2.0

@objc public protocol XLCycleScrollViewDelegate
{
    func xl_cycleScrollViewSelected(_ selectedIndex: Int)
}

public class XLCycleScrollView: UIView
{
    weak var delegate: XLCycleScrollViewDelegate?
    
    public class func cycleScrollView(frame: CGRect, margin: Int, imageArray: [Any], needPageControl: Bool) -> XLCycleScrollView
    {
        let view = XLCycleScrollView(frame: frame, margin: margin, imageArray: imageArray, needPageControl: needPageControl)
        view.layer.masksToBounds = true
        return view
    }
    
    var viewWidth        = 0
    var viewHeight       = 0
    
    var imageWidth       = 0
    var imageHeight      = 0
    
    var margin           = 0
    
    var scrollViewWidth  = 0
    var scrollViewHeight = 0
    
    var pageControlHeight = 30
    var currenIndex      = 0
    
    var _imageArray: [Any] = [Any]()
    public var imageArray: [Any] {
        set
        {
            _imageArray = newValue
            
            for subview in mainScrollView.subviews {
                subview.removeFromSuperview()
            }
            
            currenIndex = 0
            pageControl.currentPage = currenIndex
            pageControl.numberOfPages = newValue.count
            
            if newValue.count == 1 {
                mainScrollView.addSubview(leftIV)
                mainScrollView.contentSize = CGSize(width: scrollViewWidth, height: scrollViewHeight)
                mainScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
                setupImage(iv: leftIV, image: newValue.first!)
                clearTimer()
            } else if newValue.count > 1 {
                mainScrollView.addSubview(leftIV)
                mainScrollView.addSubview(middleIV)
                mainScrollView.addSubview(rightIV)
                mainScrollView.contentSize = CGSize(width: scrollViewWidth * 3, height: scrollViewHeight)
                mainScrollView.setContentOffset(CGPoint(x: scrollViewWidth, y: 0), animated: false)
                resetImage()
                setupTimer()
            } else {
                clearTimer()
            }
        }
        get
        {
            return _imageArray
        }
    }
    
    func setupImage(iv: UIImageView, image: Any)
    {
        if image is UIImage {
            iv.image = (image as! UIImage)
        } else if image is String {
            let imageStr = image as! String
            if imageStr.hasPrefix("http://") || imageStr.hasPrefix("https://") {
                iv.sd_setImage(with: URL(string: imageStr), placeholderImage: UIImage(named: ""), options: SDWebImageOptions.lowPriority, completed: nil)
            } else {
                iv.image = UIImage(named: imageStr)
            }
        }
    }
    
    convenience init(frame: CGRect, margin: Int, imageArray: [Any], needPageControl: Bool)
    {
        self.init(frame: frame)
        
        self.viewWidth = Int(frame.width)
        self.viewHeight = Int(frame.height)
        
        self.scrollViewWidth = self.viewWidth - margin
        if !needPageControl {
            self.pageControlHeight = 0
        } else {
            self.pageControlHeight = 30
        }
        self.scrollViewHeight = self.viewHeight - self.pageControlHeight
        
        self.imageWidth = self.scrollViewWidth - margin
        self.imageHeight = self.scrollViewHeight
        
        self.margin = margin
        
        setupUI()
        
        self.imageArray = imageArray
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit
    {
        clearTimer()
    }
    
    /// 自动轮播定时器
    var timer: Timer?
    
    func setupDefault()
    {
        setupTimer()
    }
    
    func setupTimer()
    {
        clearTimer() // 先移除之前的timer
        timer = Timer(timeInterval: timerInterval, target: XLTimerProxy.proxy(target: self), selector: #selector(timerAction), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .default)
    }
    
    func clearTimer()
    {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    lazy var mainScrollView: UIScrollView = {
        
        let x = (viewWidth - scrollViewWidth) / 2
        let y = 0
        
        let scrollView = UIScrollView(frame: CGRect(x: x, y: y, width: scrollViewWidth, height: scrollViewHeight))
        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = false
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    lazy var leftIV: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: margin/2, y: 0, width: imageWidth, height: imageHeight))
        iv.contentMode = UIView.ContentMode.scaleToFill
        iv.layer.masksToBounds = true
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cycleViewSelected)))
        return iv
    }()
    
    lazy var middleIV: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: scrollViewWidth + margin/2, y: 0, width: imageWidth, height: imageHeight))
        iv.contentMode = UIView.ContentMode.scaleToFill
        iv.isUserInteractionEnabled = true
        iv.layer.masksToBounds = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cycleViewSelected)))
        return iv
    }()
    
    lazy var rightIV: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: scrollViewWidth * 2 + margin/2, y: 0, width: imageWidth, height: imageHeight))
        iv.contentMode = UIView.ContentMode.scaleToFill
        iv.isUserInteractionEnabled = true
        iv.layer.masksToBounds = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cycleViewSelected)))
        return iv
    }()
    
    lazy var pageControlView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: Int(self.frame.height) - pageControlHeight, width: Int(self.frame.width), height: pageControlHeight))
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let page = UIPageControl(frame: CGRect(x: 0, y: 0, width: Int(self.frame.width), height: pageControlHeight))
        page.numberOfPages = imageArray.count
        page.currentPage = 0
        page.pageIndicatorTintColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        page.currentPageIndicatorTintColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        return page
    }()
    
    func setupUI()
    {
        addSubview(mainScrollView)
        if self.pageControlHeight > 0 {
            addSubview(pageControlView)
            pageControlView.addSubview(pageControl)
        }
    }
    
    func resetImage()
    {
        if  currenIndex < 0 {
            currenIndex = imageArray.count - 1
        } else if currenIndex >= imageArray.count {
            currenIndex = 0
        }
        
        var left = currenIndex - 1
        let middle = currenIndex
        var right = currenIndex + 1
        
        if left < 0 {
            left = imageArray.count - 1
        }
        
        if right >= imageArray.count {
            right = 0
        }
        
        setupImage(iv: leftIV, image: imageArray[left])
        setupImage(iv: middleIV, image: imageArray[middle])
        setupImage(iv: rightIV, image: imageArray[right])
        mainScrollView.setContentOffset(CGPoint(x: scrollViewWidth, y: 0), animated: false)
        
        pageControl.currentPage = currenIndex
    }
    
    @objc fileprivate func timerAction()
    {
        if imageArray.count > 1 {
            mainScrollView.scrollRectToVisible(CGRect(x: scrollViewWidth * 2, y: 0, width: scrollViewWidth, height: scrollViewHeight), animated: true)
        }
    }
    
    
}


extension XLCycleScrollView
{
    @objc private func cycleViewSelected()
    {
        self.delegate?.xl_cycleScrollViewSelected(currenIndex)
    }
}


extension XLCycleScrollView: UIScrollViewDelegate
{
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        if imageArray.count <= 1 {
            return
        }
        
        /// 两张或以上时轮播滚动
        let contentX = scrollView.contentOffset.x
        if contentX <= 0 { // 向右滑动，上一张
            currenIndex -= 1
            resetImage()
            mainScrollView.setContentOffset(CGPoint(x: scrollViewWidth, y: 0), animated: false)
        } else if contentX >= scrollView.frame.width * 2 { // 向左滑动，下一张
            currenIndex += 1
            resetImage()
            mainScrollView.setContentOffset(CGPoint(x: scrollViewWidth, y: 0), animated: false)
        }
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)
    {
        if imageArray.count <= 1 {
            return
        }
        
        if scrollView.contentOffset.x == scrollView.bounds.width * 2 {
            currenIndex += 1
            resetImage()
        }
    }
    
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        if imageArray.count <= 1 {
            return
        }
        timer?.fireDate = Date.distantFuture
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        if imageArray.count <= 1 {
            return
        }
        timer?.fireDate = Date(timeIntervalSinceNow: timerInterval)
    }
    
}

class XLTimerProxy: NSObject
{
    
    weak var target : AnyObject?
    
    class func proxy(target: AnyObject) -> XLTimerProxy
    {
        let proxy = XLTimerProxy()
        proxy.target = target
        return proxy
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any?
    {
        return self.target
    }
    
}

