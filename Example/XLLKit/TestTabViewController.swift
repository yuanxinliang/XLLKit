//
//  TestTabViewController.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import XLLKit

class TestTabViewController: UIViewController {

    var w = UIScreen.main.bounds.width
    var categoryView: CategoryView?
    var scrollView: UIScrollView?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        demo2()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
//        self.categoryView?.sources = ["荔枝", "番茄", "贡梨", "榴莲", "草莓", "葡萄", "番石榴"]
//        self.categoryView?.xl_reload()
    }
    
    func demo2()
    {
        let a = CategoryView(frame: CGRect(x: 0, y: 88, width: w, height: 40))
        self.view.addSubview(a)
        a.sources = ["香蕉", "小苹果", "龙眼", "大西瓜", "妃子笑", "糯米滋", "水蜜桃", "香瓜", "美橙", "山竹",  "黑加仑", "提子", "荔枝", "番茄", "贡梨", "榴莲", "草莓", "葡萄", "番石榴"]
        a.xl_show()
        a.delegate = self
        self.categoryView = a
        
        let s = UIScrollView(frame: CGRect(x: 0, y: 128, width: self.view.bounds.width, height: self.view.bounds.height - 128))
        s.isPagingEnabled = true
        s.delegate = self
        self.view.addSubview(s)
        let w = s.bounds.width
        let h = s.bounds.height
        s.contentSize = CGSize(width: CGFloat(a.sources.count) * w, height: h)
        for i in 0..<a.sources.count {
            let frame = CGRect(x: CGFloat(i) * w, y: 0, width: w, height: h)
            let view = UIView(frame: frame)
            view.backgroundColor = UIColor.xl.randomColor()
            s.addSubview(view)
        }
        self.scrollView = s
    }
    
    func demo1()
    {
        self.view.backgroundColor = .white
        let a = TestCategoryView(frame: CGRect(x: 0, y: 200, width: Screen.xl.width, height: 30))
        a.backgroundColor = .cyan
        self.view.addSubview(a)
    }

}

extension TestTabViewController: UIScrollViewDelegate, XLCategoryViewDelegate
{
    func xl_categroyViewSelectIndex(index: Int)
    {
        print(index)
        let w = self.scrollView!.bounds.width
        self.scrollView!.setContentOffset(CGPoint(x: CGFloat(index) * w, y: 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        let w = scrollView.bounds.width
        let x = scrollView.contentOffset.x
        let index = Int(x / w)
        self.categoryView?.xl_select(index: index)
    }
}
