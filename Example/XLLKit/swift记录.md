Swift

```
#if DEBUG
    let name = "zhangsan"
#else
    let name = "lisi"
#endif

if #available(iOS 11.0, *) {
    tableVeiw.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
} else {
    // Fallback on earlier versions
}

self.automaticallyAdjustsScrollViewInsets = true

make.height.equalTo(zz_y(100)).constraint.layoutConstraints.first?.priority = UILayoutPriority(rawValue: 999)
make.height.equalTo(zz_y(100)).priorityHigh()
make.width.height.equalTo(34).priority(ConstraintPriority(1000))


override var currentPage: Int {
    set {
        super.currentPage = newValue
    }
    get {
        return super.currentPage
    }
}

let vc = zz_currentVC()
let tempArray = NSMutableArray(array: (vc?.navigationController!.viewControllers)!)
tempArray.removeObject(at: 2)
vc?.navigationController?.setViewControllers(tempArray as! [UIViewController], animated: true)


print(String(describing: type(of: self)))

print(String(describing: ViewController.self))
print(String(describing: self.self))

// 设置textview内边距
tv.textContainerInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: -5);

CGFlot xMargin =12, yMargin = 10;
// 使用textContainerInset设置top、left、right
textView.textContainerInset = UIEdgeInsetsMake(yMargin, xMargin, 0, xMargin);
//当光标在最后一行时，始终显示低边距，需使用contentInset设置bottom.
textView.contentInset = UIEdgeInsetsMake(0, 0, yMargin, 0);
//防止在拼音打字时抖动
textView.layoutManager.allowsNonContiguousLayout=NO;

// 文本输入框
let temp = (textField.text! as NSString).replacingCharacters(in: range, with: string)

// 沙盒位置
let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)


/// 金额格式化
fileprivate func moneyFormatter(money: Float) -> String
{
    let number = NSNumber(value: money)
    let formatter = NumberFormatter()
    // 设置显示样式
    formatter.numberStyle = .decimal
    // 设置小数点后最多2位
    formatter.maximumFractionDigits = 2
    // 设置小数点后最少2位（不足补0）
    formatter.minimumFractionDigits = 2
    // 自定义前缀
    formatter.positivePrefix = "￥"
    // 设置用组分隔
    formatter.usesGroupingSeparator = true
    // 分隔符号
    formatter.groupingSeparator = ","
    // 分隔位数
    formatter.groupingSize = 3
    // 格式化
    let format = formatter.string(from: number)
    return format ?? "￥0.00"
}
```

