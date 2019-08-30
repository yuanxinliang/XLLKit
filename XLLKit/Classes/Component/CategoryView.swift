//
//  CategoryView.swift
//  XLLKit
//
//  Created by XL Yuen on 2019/6/4.
//

import UIKit

@objc public protocol XLCategoryViewDelegate: NSObjectProtocol
{
    func xl_categroyViewSelectIndex(index: Int)
}

/// 分类切换标签视图
public class CategoryView: UIView
{
    public weak var delegate: XLCategoryViewDelegate?
    
    /// 给label打上tag用的
    fileprivate let baseTag: Int = 1000
    
    /// 标题数组
    public var sources: [String]   = [String]()
    
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
    public var categoryLabelHeight: CGFloat = 0 // 分类标签的高度
    public var selectLabelHeight: CGFloat = 5 // 选中标签底部控件的高度
    
    /// 滚动视图
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.categoryLabelHeight)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.layer.masksToBounds = false
        collectionView.backgroundColor = .brown
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        return collectionView
    }()
    
    lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    public override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.backgroundColor = .cyan
        self.categoryLabelHeight = frame.size.height - self.selectLabelHeight
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func xl_show()
    {
        self.addSubview(self.collectionView)
        self.collectionView.addSubview(self.indicatorView)
        let cell = self.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        self.indicatorView.frame = CGRect(x: cell.frame.minX, y: cell.frame.maxY + 1, width: cell.frame.width, height: 3)
        self.delegate?.xl_categroyViewSelectIndex(index: 0)
    }
    
    /// sources赋值之后，刷新UI
    public func xl_reload()
    {
        self.selectIndex = 0
        self.collectionView.reloadData()
        let indexPath = IndexPath(row: self.selectIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        let cell = self.collectionView(collectionView, cellForItemAt: indexPath)
        
        var frame = self.indicatorView.frame
        frame.origin.x = cell.frame.minX
        frame.size.width = cell.frame.width
        self.indicatorView.frame = frame
        self.delegate?.xl_categroyViewSelectIndex(index: 0)
    }
    
    /// 选中上一个
    public func xl_previous()
    {
        let pre = self.selectIndex - 1
        xl_select(index: pre)
    }
    
    /// 选中下一个
    public func xl_next()
    {
        let next = self.selectIndex + 1
        xl_select(index: next)
    }
    
    /// 选中某一个
    public func xl_select(index: Int)
    {
        var row = index
        if row < 0 {
            row = 0
        } else if row > (self.sources.count - 1) {
            row = self.sources.count - 1
        }
        self.selectIndex = row

        let indexPath = IndexPath(row: row, section: 0)
        
        let cell = self.collectionView(self.collectionView, cellForItemAt: indexPath)
        
        UIView.animate(withDuration: 0.3, animations: {
            var frame = self.indicatorView.frame
            frame.origin.x = cell.frame.minX
            frame.size.width = cell.frame.width
            self.indicatorView.frame = frame
        }) { (finish) in
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        self.delegate?.xl_categroyViewSelectIndex(index: indexPath.row)
    }
    
    
    
}

extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.sources.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let size = CGSize(width: CGFloat(ceilf(Float(stringWidth(string: self.sources[indexPath.row])))), height: self.categoryLabelHeight)
        return size
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: CategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.backgroundColor = UIColor.green
        cell.text = self.sources[indexPath.row]
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = self.collectionView(collectionView, cellForItemAt: indexPath)
        UIView.animate(withDuration: 0.3, animations: {
            var frame = self.indicatorView.frame
            frame.origin.x = cell.frame.minX
            frame.size.width = cell.frame.width
            self.indicatorView.frame = frame
        }) { (finish) in
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        self.delegate?.xl_categroyViewSelectIndex(index: indexPath.row)
    }
    
}

extension CategoryView
{
    /// 根据固定高度和字体，计算字符串的宽度
    func stringWidth(string: String) -> CGFloat
    {
        let size = CGSize(width: CGFloat(MAXFLOAT), height: self.categoryLabelHeight)
        let options: NSStringDrawingOptions = .usesLineFragmentOrigin
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        let tempStr = string as NSString
        
        let frame = tempStr.boundingRect(with: size, options: options, attributes: attributes, context: nil)
        return frame.width
    }
}
