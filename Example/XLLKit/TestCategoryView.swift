//
//  TestCategoryView.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/12.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import XLLKit

class TestCategoryView: UIView {

    var sources: [String] = ["香蕉", "小苹果", "龙眼", "大西瓜", "妃子笑", "糯米滋", "水蜜桃", "香瓜", "美橙", "山竹",  "黑加仑", "提子", "荔枝", "番茄", "贡梨", "榴莲", "草莓", "葡萄", "番石榴"]
//    var sources: [String] = ["香蕉", "小苹果", "龙眼"]
    var indicatorView: UIView!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
//        flowLayout.itemSize = CGSize(width: bounds.size.width / 4.0, height: bounds.size.height)
//        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//        flowLayout.minimumLineSpacing = 20 // 横向间距
//        flowLayout.minimumInteritemSpacing = 0 // 纵向间距
        
        let frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 5)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.layer.masksToBounds = false
        collectionView.backgroundColor = .brown
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TestCategoryCell.self, forCellWithReuseIdentifier: "TestCategoryCell")
        self.addSubview(collectionView)
        
        let indicatorView = UIView()
        indicatorView.backgroundColor = .red
        indicatorView.layer.masksToBounds = true
        indicatorView.layer.cornerRadius = 1.5
        collectionView.addSubview(indicatorView)
        self.indicatorView = indicatorView
        
        let cell = self.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0))
        indicatorView.frame = CGRect(x: cell.frame.minX, y: cell.frame.maxY + 1, width: cell.frame.width, height: 3)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TestCategoryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.sources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {

        let size = CGSize(width: CGFloat(ceilf(Float(stringWidth(string: self.sources[indexPath.row])))), height: bounds.size.height - 5)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    /// 根据固定高度和字体，计算字符串的宽度
    func stringWidth(string: String) -> CGFloat
    {
        let frame = (string as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 30), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], context: nil)
        return frame.width
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: TestCategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCategoryCell", for: indexPath) as! TestCategoryCell
        cell.backgroundColor = UIColor.green
        cell.text = self.sources[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        let cell = self.collectionView(collectionView, cellForItemAt: indexPath)
        
        UIView.animate(withDuration: 0.3) {
            var frame = self.indicatorView.frame
            frame.origin.x = cell.frame.minX
            frame.size.width = cell.frame.width
            self.indicatorView.frame = frame
        }
        
    }
    
    
}
