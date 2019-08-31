//
//  MVVMView.swift
//  XLLKit_Example
//
//  Created by XL Yuen on 2019/8/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

protocol MVVMViewDelegate: NSObjectProtocol {
    func mvvmViewDidClick(_ view: MVVMView)
}

class MVVMView: UIView {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    weak var delegate: MVVMViewDelegate?
    weak var vm: MVVMvm!
    
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
    
    deinit {
        print("deinit - MVVMView")
    }
    
    func setupObserver() {
        vm.addObserver(self, forKeyPath: "title", options: [.new, .old], context: nil)
        vm.addObserver(self, forKeyPath: "image", options: [.new, .old], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if (keyPath ?? "") == "title" {
            let value = change?[NSKeyValueChangeKey.newKey] ?? ""
            setTitle(value as! String)
        }
        
        if (keyPath ?? "") == "image" {
            let value = change?[NSKeyValueChangeKey.newKey] ?? ""
            setImage(value as! String)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setImage(_ image: String) {
        imageView.image = UIImage(named: image)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(Date())
        delegate?.mvvmViewDidClick(self)
    }

}
