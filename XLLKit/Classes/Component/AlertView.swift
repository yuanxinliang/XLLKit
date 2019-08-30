//
//  AlertView.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/3.
//

import UIKit

/// 对话框
public typealias AlertViewClosure = () -> Void



public class AlertView: UIView
{
    
    let screenW                  : CGFloat =   UIScreen.main.bounds.size.width // 屏幕宽度
    let alertViewLeftM           : CGFloat =   50  // alertview 左边距
    let alertViewW               : CGFloat =   (UIScreen.main.bounds.size.width - 50 * 2) // alertview宽度
    let alertViewCornerRadius    : CGFloat =   10 // alertview的圆角
    let alertViewTitieTopM       : CGFloat =   20 // 标题距离顶部的边距
    let alertViewTitleMessageV   : CGFloat =   5  // 标题与内容的边距
    let alertViewTitieLeftM      : CGFloat =   15 // 标题距离左边的边距
    let alertViewTitleW          : CGFloat =   ((UIScreen.main.bounds.size.width - 50 * 2) - 50 * 2) // 标题宽度
    let alertViewBtnH            : CGFloat =   44 // 按钮的高度
    
    let colorTitle        : UIColor = UIColor.xl.hex(0x07090C)
    let colorMessage      : UIColor = UIColor.xl.hex(0x07090C)
    let colorCancelTitle  : UIColor = UIColor.xl.hex(0x07090C)
    let colorConfirmTitle : UIColor = UIColor.xl.hex(0x4685F0)
    let colorLine         : UIColor = UIColor.xl.hex(0xE9E9FF)
    
    /**
     @param message 提示文字
     */
    public class func showAlertView(message: String?)
    {
        let alertView = AlertView(frame: UIScreen.main.bounds, title: nil, message: message, cancelTitle: nil, confirmTitle: nil, cancelClosure: nil, confirmClosure: nil)
        alertView.alpha = 0.0
        
        let keyWindow = UIApplication.shared.keyWindow
        keyWindow?.addSubview(alertView)
        
        UIView.animate(withDuration: 0.25) {
            alertView.alpha = 1.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            alertView.removeFromSuperview()
        }
    }
    
    /**
     @param message 提示文字
     @param cancelTitle 按钮标题
     */
    public class func showAlertView(message: String?, cancelTitle: String?, cancelClosure: AlertViewClosure?)
    {
        setupAlertView(title: nil, message: message, cancelTitle: cancelTitle, confirmTitle: nil, cancelClosure: cancelClosure, confirmClosure: nil)
    }
    
    /**
     @param title 提示标题
     @param message 提示文字
     @param cancelTitle 按钮标题
     */
    public class func showAlertView(title: String?, message: String?, cancelTitle: String?, cancelClosure: AlertViewClosure?)
    {
        setupAlertView(title: title, message: message, cancelTitle: cancelTitle, confirmTitle: nil, cancelClosure: cancelClosure, confirmClosure: nil)
    }
    
    /**
     @param message 提示内容
     @param confirmTitle 按钮文字
     @param confirmBlock 回调
     */
    public class func showAlertView(message: String?, confirmTitle: String?, confirmClosure: AlertViewClosure?)
    {
        setupAlertView(title: nil, message: message, cancelTitle: nil, confirmTitle: confirmTitle, cancelClosure: nil, confirmClosure: confirmClosure)
    }
    
    /**
     @param message 提示内容
     @param confirmTitle 按钮文字
     @param confirmBlock 回调
     */
    public class func showAlertView(title: String?, message: String?, confirmTitle: String?, confirmClosure: AlertViewClosure?)
    {
        setupAlertView(title: title, message: message, cancelTitle: nil, confirmTitle: confirmTitle, cancelClosure: nil, confirmClosure: confirmClosure)
    }
    
    /**
     @param message 提示内容
     @param cancelTitle 取消按钮标题
     @param confirmTitle 确定按钮标题
     */
    public class func showAlertView(message: String?, cancelTitle: String?, confirmTitle: String?, cancelClosure: AlertViewClosure?, confirmClosure: AlertViewClosure?)
    {
        setupAlertView(title: nil, message: message, cancelTitle: cancelTitle, confirmTitle: confirmTitle, cancelClosure: cancelClosure, confirmClosure: confirmClosure)
    }
    
    /**
     @param title 提示标题
     @param message 提示内容
     @param cancelTitle 取消按钮标题
     @param confirmTitle 确定按钮标题
     */
    public class func showAlertView(title: String?, message: String?, cancelTitle: String?, confirmTitle: String?, cancelClosure: AlertViewClosure?, confirmClosure: AlertViewClosure?)
    {
        setupAlertView(title: title, message: message, cancelTitle: cancelTitle, confirmTitle: confirmTitle, cancelClosure: cancelClosure, confirmClosure: confirmClosure)
    }
    
    class func setupAlertView(title: String?, message: String?, cancelTitle: String?, confirmTitle: String?, cancelClosure: AlertViewClosure?, confirmClosure: AlertViewClosure?)
    {
        let alertView = AlertView(frame: UIScreen.main.bounds, title: title, message: message, cancelTitle: cancelTitle, confirmTitle: confirmTitle, cancelClosure: cancelClosure, confirmClosure: confirmClosure)
        alertView.alpha = 0.0
        
        let keyWindow = UIApplication.shared.keyWindow
        keyWindow?.endEditing(true)
        keyWindow?.addSubview(alertView)
        
        UIView.animate(withDuration: 0.25) {
            alertView.alpha = 1.0
        }
    }
    
    // MARK: /* 分割线 -- 以上是 AlertView 显示调用 */
    
    // MARK: /* 分割线 -- 以下是 AlertView 初始化 */
    
    fileprivate var title: String?
    fileprivate var message: String?
    fileprivate var cancelTitle: String?
    fileprivate var confirmTitle: String?
    fileprivate var cancelClosure: AlertViewClosure?
    fileprivate var confirmClosure: AlertViewClosure?
    
    convenience init(frame: CGRect, title: String?, message: String?, cancelTitle: String?, confirmTitle: String?, cancelClosure: AlertViewClosure?, confirmClosure: AlertViewClosure?)
    {
        self.init(frame: frame)
        self.title = title
        self.message = message
        self.cancelTitle = cancelTitle
        self.confirmTitle = confirmTitle
        self.cancelClosure = cancelClosure
        self.confirmClosure = confirmClosure
        setupUI()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let contentView = UIView()
    fileprivate let titleLabel = UILabel()
    fileprivate let messageLabel = UILabel()
    fileprivate let cancelBtn = UIButton()
    fileprivate let confirmBtn = UIButton()
    fileprivate let vLine = UIView()
    fileprivate let hLine = UIView()
    
    fileprivate func setupContentView()
    {
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = alertViewCornerRadius
        contentView.layer.masksToBounds = true
        addSubview(contentView)
    }
    
    fileprivate func setupTitleLabel()
    {
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "PingFangSC-Regular", size: 15)
        titleLabel.textColor = colorTitle
        contentView.addSubview(titleLabel)
    }
    
    fileprivate func setupMessageLabel()
    {
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont(name: "PingFangSC-Regular", size: 15)
        messageLabel.textColor = colorMessage
        contentView.addSubview(messageLabel)
    }
    
    fileprivate func setupCancelBtn()
    {
        cancelBtn.setTitle(cancelTitle, for: .normal)
        cancelBtn.setTitleColor(colorCancelTitle, for: .normal)
        cancelBtn.titleLabel?.font = UIFont(name: "PingFangSC-Regular", size: 15)
        cancelBtn.addTarget(self, action: #selector(cancelBtnAction(sender:)), for: .touchUpInside)
        contentView.addSubview(cancelBtn)
    }
    
    fileprivate func setupConfirmBtn()
    {
        confirmBtn.setTitle(confirmTitle, for: .normal)
        confirmBtn.setTitleColor(colorConfirmTitle, for: .normal)
        confirmBtn.titleLabel?.font = UIFont(name: "PingFangSC-Regular", size: 15)
        confirmBtn.addTarget(self, action: #selector(confirmBtnAction(sender:)), for: .touchUpInside)
        contentView.addSubview(confirmBtn)
    }
    
    fileprivate func setupVLine()
    {
        vLine.backgroundColor = colorLine
        contentView.addSubview(vLine)
    }
    
    fileprivate func setupHLine()
    {
        hLine.backgroundColor = colorLine
        contentView.addSubview(hLine)
    }
    
    fileprivate func setupUI()
    {
        setupContentView()
        setupTitleLabel()
        setupMessageLabel()
        setupCancelBtn()
        setupConfirmBtn()
        setupVLine()
        setupHLine()
        
        var alertViewHeight: CGFloat = 0
        var y: CGFloat = 0
        var titleHeight: CGFloat = 0
        var messageHeight: CGFloat = 0
        
        if title?.count ?? 0 > 0 {
            titleHeight = calculateHeight(string: title!, font: titleLabel.font)
        }
        
        if message?.count ?? 0 > 0 {
            messageHeight = calculateHeight(string: message!, font: titleLabel.font)
        }
        
        if (title?.count ?? 0 > 0) && (message?.count ?? 0 > 0) {
            
            titleLabel.frame = CGRect(x: alertViewTitieLeftM, y: alertViewTitieTopM, width: alertViewTitleW, height: titleHeight)
            messageLabel.frame = CGRect(x: alertViewTitieLeftM, y: titleLabel.frame.maxY + alertViewTitleMessageV, width: alertViewTitleW, height: messageHeight)
            y = alertViewTitieTopM + titleHeight + messageHeight + alertViewTitleMessageV
            
        } else if titleHeight > 0 {
            
            titleLabel.frame = CGRect(x: alertViewTitieLeftM, y: alertViewTitieTopM, width: alertViewTitleW, height: titleHeight)
            y = alertViewTitieTopM + titleHeight
            
        } else if messageHeight > 0 {
            
            messageLabel.frame = CGRect(x: alertViewTitieLeftM, y: alertViewTitieTopM, width: alertViewTitleW, height: messageHeight)
            y = alertViewTitieTopM + messageHeight
            
        }
        
        if (cancelTitle?.count ?? 0 == 0) && (confirmTitle?.count ?? 0 == 0) {
            
            alertViewHeight = y + alertViewTitieTopM
            
        } else {
            
            hLine.frame = CGRect(x: CGFloat(0.0), y: messageLabel.frame.maxY + alertViewTitieTopM, width: alertViewW, height: 0.5)
            
            if (cancelTitle?.count ?? 0 > 0) && (confirmTitle?.count ?? 0 > 0) {
                
                vLine.frame = CGRect(x: hLine.frame.midX, y: hLine.frame.maxY, width: 0.5, height: alertViewBtnH)
                
                cancelBtn.frame = CGRect(x: CGFloat(0), y: hLine.frame.maxY, width: alertViewW / 2, height: alertViewBtnH)
                
                confirmBtn.frame = CGRect(x: CGFloat(alertViewW / 2), y: hLine.frame.maxY, width: alertViewW / 2, height: alertViewBtnH)
                
            } else if (cancelTitle?.count ?? 0 > 0) {
                
                cancelBtn.frame = CGRect(x: CGFloat(0), y: hLine.frame.maxY, width: alertViewW, height: alertViewBtnH)
                
                cancelBtn.setTitleColor(colorCancelTitle, for: .normal)
                
            } else if (confirmTitle?.count ?? 0 > 0) {
                confirmBtn.frame = CGRect(x: CGFloat(0), y: hLine.frame.maxY, width: alertViewW, height: alertViewBtnH)
            }
            
            y += alertViewTitieTopM + 1 + alertViewBtnH
            alertViewHeight = y
        }
        contentView.frame = CGRect(x: 0, y: 0, width: alertViewW, height: alertViewHeight)
        contentView.center = self.center
    }
    
    fileprivate func calculateHeight(string: String, font: UIFont) -> CGFloat
    {
        let width = alertViewW - alertViewTitieLeftM * 2
        return string.xl.height(width: width, font: font)
    }
    
    fileprivate func hideAlertView()
    {
        removeFromSuperview()
    }
    
    @objc fileprivate func cancelBtnAction(sender: UIButton)
    {
        hideAlertView()
        if self.cancelClosure != nil {
            self.cancelClosure!()
        }
    }
    
    @objc fileprivate func confirmBtnAction(sender: UIButton)
    {
        hideAlertView()
        if self.confirmClosure != nil {
            self.confirmClosure!()
        }
    }
}
