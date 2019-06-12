//
//  TestCategoryCell.swift
//  XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/12.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class TestCategoryCell: UICollectionViewCell
{
    
    var text: String? {
        didSet {
            self.label.frame = self.bounds
            self.label.text = self.text
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel.xl_createLabel("测试", .black, .systemFont(ofSize: 15))
        label.textAlignment = .center
        label.backgroundColor = .orange
        self.contentView.addSubview(label)
        return label
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
