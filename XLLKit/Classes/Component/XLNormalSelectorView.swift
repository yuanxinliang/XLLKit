//
//  XLNormalSelectorView.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/6/3.
//

import UIKit

/// 单列选择器
public class XLNormalSelectorView: UIView {
    
    // MARK: 外部方法调用
    public class func showPickerView(dataSource: [String]?, title: String?, cancelBtnTitle: String?, confirmBtnTitle: String?, cancelClosure: (() -> Void)?, confirmClosure: ((String?) -> Void)?)
    {
        let view = XLNormalSelectorView(dataSource: dataSource, title: title, cancelBtnTitle: cancelBtnTitle, confirmBtnTitle: confirmBtnTitle, cancelClosure: cancelClosure, confirmClosure: confirmClosure)
        view.alpha = 0.5
        
        let keyWindow = UIApplication.shared.keyWindow
        keyWindow?.addSubview(view)
        
        UIView.animate(withDuration: 0.25) {
            view.alpha = 1.0
            view.contentView.frame = CGRect(x: 0, y: view.frame.maxY - view.contentView.frame.height, width: view.frame.width, height: view.contentView.frame.height)
        }
    }
    
    // MARK: 显示数据 -- 外部传入参数值
    
    fileprivate var dataSource: [String]?
    fileprivate var title: String?
    fileprivate var cancelBtnTitle: String?
    fileprivate var confirmBtnTitle: String?
    fileprivate var cancelClosure: (() -> Void)?
    fileprivate var confirmClosure: ((String?) -> Void)?
    
    // MARK: 初始化
    
    fileprivate convenience init(dataSource: [String]?, title: String?, cancelBtnTitle: String?, confirmBtnTitle: String?, cancelClosure: (() -> Void)?, confirmClosure: ((String?) -> Void)?)
    {
        self.init(frame: UIScreen.main.bounds)
        
        self.dataSource = dataSource
        self.title = title
        self.cancelBtnTitle = cancelBtnTitle
        self.confirmBtnTitle = confirmBtnTitle
        self.cancelClosure = cancelClosure
        self.confirmClosure = confirmClosure
        
        setupUI()
        setupFrame()
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
    
    // MARK: 控件
    
    fileprivate let contentView = UIView()
    fileprivate let cancelBtn = UIButton()
    fileprivate let confirmBtn = UIButton()
    fileprivate let titleLabel = UILabel()
    fileprivate let vLine = UIView()
    fileprivate let pickerView = UIPickerView()
    
    // MARK: 文本颜色
    
    fileprivate let cancelBtnTextColor = UIColor(red: 100 / 255.0, green: 100 / 255.0, blue: 100 / 255.0, alpha: 1.0)
    fileprivate let confirmBtnTextColor = UIColor(red: 70 / 255.0, green: 133 / 255.0, blue: 255 / 255.0, alpha: 1.0)
    fileprivate let titleLabelTextColor = UIColor(red: 50 / 255.0, green: 50 / 255.0, blue: 50 / 255.0, alpha: 1.0)
    fileprivate let lineColor = UIColor.lightGray.withAlphaComponent(0.5)
    
    // MARK: 文本大小
    
    fileprivate let cancelBtnTextFont = UIFont.systemFont(ofSize: 15)
    fileprivate let confirmBtnTextFont = UIFont.systemFont(ofSize: 15)
    fileprivate let titleLabelTextFont = UIFont.systemFont(ofSize: 16)
    
    // MARK: 设置UI
    
    fileprivate func setupContentView()
    {
        contentView.backgroundColor = UIColor.white
        self.addSubview(contentView)
    }
    
    fileprivate func setupCancelBtn()
    {
        cancelBtn.setTitle(cancelBtnTitle, for: .normal)
        cancelBtn.setTitleColor(cancelBtnTextColor, for: .normal)
        cancelBtn.titleLabel?.font = cancelBtnTextFont
        cancelBtn.contentHorizontalAlignment = .left
        cancelBtn.addTarget(self, action: #selector(cancelBtnAction(sender:)), for: .touchUpInside)
        contentView.addSubview(cancelBtn)
    }
    
    fileprivate func setupConfirmBtn()
    {
        confirmBtn.setTitle(confirmBtnTitle, for: .normal)
        confirmBtn.setTitleColor(confirmBtnTextColor, for: .normal)
        confirmBtn.titleLabel?.font = confirmBtnTextFont
        confirmBtn.contentHorizontalAlignment = .right
        confirmBtn.addTarget(self, action: #selector(confirmBtnAction(sender:)), for: .touchUpInside)
        contentView.addSubview(confirmBtn)
    }
    
    fileprivate func setupTitleLabel()
    {
        titleLabel.text = title
        titleLabel.textColor = titleLabelTextColor
        titleLabel.font = titleLabelTextFont
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
    }
    
    fileprivate func setupVLine()
    {
        vLine.backgroundColor = lineColor
        contentView.addSubview(vLine)
    }
    
    fileprivate func setupPickerView()
    {
        pickerView.delegate = self
        pickerView.dataSource = self
        contentView.addSubview(pickerView)
    }
    
    fileprivate func setupUI()
    {
        setupContentView()
        setupCancelBtn()
        setupConfirmBtn()
        setupTitleLabel()
        setupVLine()
        setupPickerView()
    }
    
    // MARK: 设置UI的位置
    
    fileprivate func setupFrame()
    {
        let h_margin: CGFloat = 20
        let btnWidth: CGFloat = 60
        let btnHeight: CGFloat = 50
        let lineHeight: CGFloat = 0.66
        let pickerViewHeight: CGFloat = 200
        
        let height: CGFloat = btnHeight + lineHeight + pickerViewHeight + CGFloat(bottomSafeAreaHeight())
        let width: CGFloat = self.frame.width
        
        contentView.frame = CGRect(x: 0, y: self.frame.height, width: width, height: height)
        cancelBtn.frame = CGRect(x: h_margin, y: 0, width: btnWidth, height: btnHeight)
        confirmBtn.frame = CGRect(x: width - h_margin - btnWidth, y: 0, width: btnWidth, height: btnHeight)
        titleLabel.frame = CGRect(x: cancelBtn.frame.maxX, y: 0, width: width - (h_margin + btnWidth) * 2, height: btnHeight)
        vLine.frame = CGRect(x: 0, y: titleLabel.frame.maxY, width: width, height: 0.5)
        pickerView.frame = CGRect(x: 0, y: vLine.frame.maxY, width: width, height: pickerViewHeight)
        
    }
    
    // MARK: 底部安全区域高度
    
    fileprivate func bottomSafeAreaHeight() -> Int
    {
        if #available(iOS 11.0, *) {
            return Int(UIApplication.shared.windows[0].safeAreaInsets.bottom)
        } else {
            return 0
        }
    }
    
    // MARK: 按钮事件点击
    
    @objc fileprivate func cancelBtnAction(sender: UIButton)
    {
        if self.cancelClosure != nil {
            self.cancelClosure!()
        }
        hidePickerView()
    }
    
    @objc fileprivate func confirmBtnAction(sender: UIButton)
    {
        if self.confirmClosure != nil {
            let str = dataSource![pickerView.selectedRow(inComponent: 0)]
            self.confirmClosure!(str)
        }
        hidePickerView()
    }
    
    fileprivate func hidePickerView()
    {
        UIView.animate(withDuration: 0.15, animations: {
            self.alpha = 0.0
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
    
}

extension XLNormalSelectorView: UIPickerViewDelegate, UIPickerViewDataSource
{
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return dataSource?.count ?? 0
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 40
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        pickerView.subviews[1].backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        pickerView.subviews[2].backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return dataSource![row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print(row)
    }
    
}
