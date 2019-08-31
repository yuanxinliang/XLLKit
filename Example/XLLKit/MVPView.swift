//
//  MVPView.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

protocol MVPViewDelegate: NSObjectProtocol {
    func mvpViewDidClick(_ view: MVPView)
}

class MVPView: UIView {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    weak var delegate: MVPViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        addSubview(iv)
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 40))
        title.textAlignment = .center
        addSubview(title)
        imageView = iv
        titleLabel = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ title: String, _ image: String) {
        imageView.image = UIImage(named: image)
        titleLabel.text = title
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(Date())
        delegate?.mvpViewDidClick(self)
    }
    
}
