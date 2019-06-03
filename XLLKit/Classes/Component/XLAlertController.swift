//
//  XLAlertController.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/3.
//

import UIKit

public class XLAlertController: UIAlertController
{
    public class func xl_alertController(vc: UIViewController, title: String?, message: String?, leftActionTitle: String?, rightActionTitle: String?, leftHandler: ((UIAlertAction) -> Void)?, rightHandler: ((UIAlertAction) -> Void)?)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if leftActionTitle?.count ?? 0 > 0 {
            let action = UIAlertAction(title: leftActionTitle, style: .cancel, handler: leftHandler)
            alertController.addAction(action)
        }
        
        if rightActionTitle?.count ?? 0 > 0 {
            let action = UIAlertAction(title: rightActionTitle, style: .default, handler: rightHandler)
            alertController.addAction(action)
        }
        
        vc.present(alertController, animated: true, completion: nil)
    }
}
