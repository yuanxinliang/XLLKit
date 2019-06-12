//
//  XLCategoryView.swift
//  XLLKit
//
//  Created by XL Yuen on 2019/6/4.
//

import UIKit

@objc protocol XLCategoryViewDelegate: NSObjectProtocol
{
    func xl_categroyViewSelectIndex(index: Int)
}

/// 分类切换标签视图
public class XLCategoryView: UIView
{
    weak var delegate: XLCategoryViewDelegate?
    
    /// 给label打上tag用的
    fileprivate let baseTag: Int = 1000
    
    /// 标题数组
    public var tabs: [String]   = [String]()
    
    /// 选中的index值
    public var selectIndex: Int = 0
    /// 选中的标题
    public var selectLabel: UILabel!
    
    /// 未选中状态标题的font
    var normalFont = UIFont.systemFont(ofSize: 15)
    /// 选中状态标题的font
    var selectFont = UIFont.systemFont(ofSize: 20)
    
    /**
     布局相关参数
     */
    public var margin: CGFloat = 20// 标题控件与滚动视图最左和最右的水平距离
    public var spacing: CGFloat = 30 // 标题控件之间的水平距离
    public var categoryLabelHeight: CGFloat = 40 // 分类标签的高度
    public var selectLabelHeight: CGFloat = 5 // 选中标签底部控件的高度
    
    /// 滚动视图
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.contentSize = CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
        scrollView.backgroundColor = .green
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = .cyan
        self.addSubview(self.scrollView)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
}
