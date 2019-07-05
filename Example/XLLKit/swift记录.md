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



// 设置textview内边距 -- https://www.jianshu.com/p/32a4747a19fb

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

// 状态栏
override var preferredStatusBarStyle: UIStatusBarStyle
{
    return .lightContent
}

fileprivate func setupChildren(title: String,
                               imageName: String,
                               selectedImageName: String,
                               rootVC: UIViewController) -> BKNavigationController
{
    let image = UIImage(named: imageName)
    let selectedImage = UIImage(named: selectedImageName)
    let item = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : bkColor("#999999")], for: .normal)
    item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : bkColor("#333333")], for: .selected)
    rootVC.tabBarItem = item
    let navi = BKNavigationController(rootViewController: rootVC)
    return navi
}

// 导航栏

class BKNavigationController: UINavigationController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.delegate = self
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        if self.children.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
            let leftItem = UIBarButtonItem(image: UIImage(named: "nav_back"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(bk_leftItemAction(sender:)))
            viewController.navigationItem.leftBarButtonItem = leftItem
        }
        super.pushViewController(viewController, animated: true)
    }

    @objc fileprivate func bk_leftItemAction(sender: UIBarButtonItem)
    {
        self.popViewController(animated: true)
    }
}

extension BKNavigationController: UINavigationControllerDelegate
{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool)
    {
        /// 设置隐藏导航栏
        if (viewController.isKind(of: BKBookkeepingController.self) ||
            viewController.isKind(of: BKBillController.self) ||
            viewController.isKind(of: BKReportFormController.self) ||
            viewController.isKind(of: BKMineController.self)) {
            self.setNavigationBarHidden(true, animated: true)
            self.navigationBar.setBackgroundImage(nil, for: .default)
        } else {
            self.setNavigationBarHidden(false, animated: true)
            self.navigationBar.setBackgroundImage(bkgetNaviBackImage(), for: .default)
        }
        self.navigationBar.shadowImage = UIImage()
    }

// MARK: --------------------------- 把view变成image ---------------------

    func bkviewToImage(_ view: UIView) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

    ///导航栏背景图片
    func bkgetNaviBackImage() -> UIImage 
    {
        let navigationView = UIView(frame: CGRect(x: 0, y: 0, width: bk_w, height: bk_navigation_h))
        navigationView.backgroundColor = bkColor("#FFFFFF")
        return bkviewToImage (navigationView)
    }

}


override func layoutSubviews()
{
    super.layoutSubviews()

    titleLabel?.adjustsFontSizeToFitWidth = true

    let w = self.frame.width
    let h = self.frame.height
    let margin: CGFloat = 3

    var label_frame = self.titleLabel?.frame
    var image_frame = self.imageView?.frame

    let label_size = label_frame?.size ?? CGSize(width: 0, height: 0)
    let label_w = label_size.width
    let label_h = label_size.height

    let image_size = image_frame?.size ?? CGSize(width: 0, height: 0)
    let image_w = image_size.width
    let image_h = image_size.height

    label_frame?.origin.x = (w - label_w) / 2
    label_frame?.origin.y = h / 2.0 - (image_h + margin)

    image_frame?.origin.x = (w - image_w) / 2
    image_frame?.origin.y = h / 2.0 + margin

    titleLabel?.frame = label_frame!
    imageView?.frame = image_frame!
}

if let resultData = result as? Data {
    do {
        let resultDic = try JSONSerialization.jsonObject(with: resultData, options: .allowFragments)
        print(resultDic)
        let model = try JSONDecoder().decode(HDMainBaseModel.self, from: resultData)
    } catch {
        print(error)
    }
}

let tempArray = NSMutableArray(array: (vc?.navigationController!.viewControllers)!)
print(tempArray)
// tempArray.removeObject(at: 2)
tempArray.remove(loginVC)
vc?.navigationController?.setViewControllers(tempArray as! [UIViewController], animated: true)


```

