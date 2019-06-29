//
//  TestPageViewController.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/18.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import XLLKit
import JXPagingView
import MJRefresh

class TestPageViewController: UIViewController {

    var pageView: JXPagingView!
    var pageHeaderView: TestPageHeaderView!
    var categoryView: XLCategoryView!
    var titles1: [String] = ["深圳", "广州", "中山", "珠海", "海丰", "惠州", "汕尾", "梅陇", "小路破"]
//    var titles2: [String] = ["🍎", "🍉", "🍌", "🌰", "🍆", "🍇", "🍅", "🥔", "🍅"]
    var titles2: [String] = ["惠州1", "惠州2", "惠州3", "惠州4", "惠州5", "惠州6", "惠州7", "惠州8", "惠州9"]
    var titles: [String] = [String]()
    var mjHeader: MJRefreshNormalHeader = MJRefreshNormalHeader()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .white
        
        self.titles = self.titles1
        
        let w = UIScreen.main.bounds.size.width
        // 1
        let frame1 = CGRect(x: 0, y: 0, width: w, height: 150)
        pageHeaderView = TestPageHeaderView(frame: frame1)
        // 2
        let frame2 = CGRect(x: 0, y: 0, width: w, height: 40)
        categoryView = XLCategoryView(frame: frame2)
        categoryView.delegate = self
        categoryView.sources = titles
        categoryView.xl_show()
        // 3
        pageView = JXPagingView(delegate: self)
        self.view.addSubview(pageView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(jx_scrollViewDidEndDecelerating(noti:)), name: NSNotification.Name(rawValue: "JXScrollViewDidEndDecelerating"), object: nil)
        
        
        self.mjHeader = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(mj_headerRefreshAction))
        pageView.mainTableView.mj_header = self.mjHeader
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func jx_scrollViewDidEndDecelerating(noti: Notification)
    {
        self.categoryView.xl_select(index: noti.object as! Int)
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        pageView.frame = self.view.bounds
        print("viewDidLayoutSubviews")
    }
    
    var flag = false
    @objc func mj_headerRefreshAction()
    {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.mjHeader.endRefreshing()
            if self.flag {
                self.titles = self.titles1
            } else {
                self.titles = self.titles2
            }
            self.categoryView.sources = self.titles
            self.categoryView.xl_reload()
            self.pageView.reloadData()
            self.flag = !self.flag
        }
    }

}

extension TestPageViewController: XLCategoryViewDelegate {
    
    func xl_categroyViewSelectIndex(index: Int)
    {
        if self.pageView != nil {
            self.pageView.listContainerView.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension TestPageViewController: JXPagingViewDelegate {
    
    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int
    {
        return 150
    }
    
    func tableHeaderView(in pagingView: JXPagingView) -> UIView
    {
        return pageHeaderView
    }
    
    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int
    {
        return 40
    }
    
    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView
    {
        return categoryView
    }
    
    func numberOfLists(in pagingView: JXPagingView) -> Int
    {
        return titles.count
    }
    
    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate
    {
        let list = TestPageListView(frame: self.view.bounds)
        return list
    }
}
