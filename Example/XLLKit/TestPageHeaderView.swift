//
//  TestPageHeaderView.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class TestPageHeaderView: UIView {

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
        backgroundColor = UIColor.xl.randomColor()
    }
    
    fileprivate func setupUI()
    {
        
    }
}
