//
//  AViewController.swift
//  PodTestDemo
//
//  Created by ZZCMXL on 2019/6/3.
//  Copyright © 2019 ZZCMXL. All rights reserved.
//

import UIKit
import XLLKit

class AViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
//        self.present(BViewController(), animated: true, completion: nil)
//        print(XLTool.xl_getTopViewController() as Any)
        
        let animation = CATransition()
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        animation.type = CATransitionType.reveal
        animation.subtype = CATransitionSubtype.fromBottom
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.popViewController(animated: false)
        
    }
}
