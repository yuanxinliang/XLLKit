//
//  TestPageListView.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import JXPagingView

class TestPageListView: UIView {
    
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    
    lazy var tableView :UITableView = {
        let tv = UITableView()
        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 34, right: 0)
        tv.dataSource = self
        tv.delegate = self
        tv.estimatedRowHeight = 80.0
        tv.separatorStyle = .none
        tv.tableFooterView = UIView()
        tv.backgroundColor = UIColor.xl_randomColor()
        setupTableViewRegisterCell(tv: tv)
        return tv
    }()
    
    func setupTableViewRegisterCell(tv: UITableView)
    {
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupDefault()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupDefault()
    {
        backgroundColor = UIColor.xl_randomColor()
    }
    
    fileprivate func setupUI()
    {
        self.tableView.frame = self.bounds
        self.addSubview(self.tableView)
    }
    
}

extension TestPageListView: JXPagingViewListViewDelegate {
    
    func listView() -> UIView
    {
        return self
    }
    
    func listScrollView() -> UIScrollView
    {
        return self.tableView
    }
    
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ())
    {
        self.listViewDidScrollCallback = callback
    }
    
    func listDidDisappear()
    {
    }
    
    func listDidAppear()
    {
    }
}

extension TestPageListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.textLabel?.text = "row - \(indexPath.row)"
        cell?.backgroundColor = .clear
        return cell!
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        self.listViewDidScrollCallback?(scrollView)
    }
    
}
