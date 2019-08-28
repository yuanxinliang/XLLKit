//
//  XLCategoryCell.swift
//  XLLKit
//
//  Created by ZZCMXL on 2019/6/18.
//

import UIKit

public class XLCategoryCell: UICollectionViewCell
{
    var text: String?
    {
        didSet {
            self.contentLabel.frame = self.bounds
            self.contentLabel.text = self.text
        }
    }
    
    lazy var contentLabel: UILabel = {
        let label = UILabel.xl.createLabel("标题", .black, .systemFont(ofSize: 15))
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
