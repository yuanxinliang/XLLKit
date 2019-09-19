//
//  String+Extension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//


// MARK: - 正则字符串

public enum XLRegularString: String
{
    /*
     ^  开始位置
     $  结束位置
     \d 等价[0-9]
     \D 等价[^0-9]
     \w 等价[A-Za-z_0-9]
     \W 等价[^A-Za-z_0-9]
     *  0个或0个以上
     +  一个或一个以上
     ?  0个或一个
     .  匹配除换行符以外的任意字符
     
     [\u4E00-\u9FA5] 汉字的正则匹配
     */
    
    /// 手机号格式 - 只允许数字，示例：13512345678
    case phoneNumber = "^(1)(\\d{10})$"
    
    /// 固定电话格式 - 只允许数字，示例：075511223344 或 02011223344
    case telephoneNumber = "^(0)(\\d{2,3})(\\d{7,8})$"
    
    /// 验证码格式 - 只允许数字，示例：1234 或 123456 （4位或6位的验证码）
    case verificationCode = "^(\\d{4}|\\d{6})$"
    
    /// 邮箱格式 - 只允许英文字母、数字、下划线、英文句号、以及中划线组成 y-30@qq.com
    case email = "^([\\w-]+)(@)([A-Za-z\\d]+)(\\.)([A-Za-z\\d]+)$"
    
    /// 用户名格式 - 只允许使用字母、数字、下滑线、横杠，3~20位
    case username = "^[\\w-]{3,20}$"
    
    /*
     ^(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{6,20}$
     
     ^ 匹配一行的开头位置
     (?![0-9]+$) 预测该位置后面不全是数字
     (?![A-Za-z]+$) 预测该位置后面不全是字母
     [A-Za-z0-9] {6,20} 由6-20位数字或字母组成
     $ 匹配行尾位置
     */
    
    /// 密码格式 - 0.字母和数字组合的字符串 1.至少包含一个字母；2.至少包含一个数字；3，长度为6~20位
//    case password = "^(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{6,20}$"
    case password = "^(?=.*[\\d]+)(?=.*[A-Za-z]+)([A-Za-z\\d]{6,20})$"
    
    /// 邮政编码格式 - 必须由6位数字组成
    case postalCode = "^\\d{6}$"
    
    /// 身份证号格式 - 15位或18位的身份证号
    case idCardNumber = "^(\\d{14}|\\d{17})([\\dxX])$"
    
    /// 数字 - 包含数字
    case hasNumber = "[\\d]+"
    
    /// 数字 - 只包含数字
    case allNumber = "^[\\d]+$"
    
    /// 小写字母 - 包含小写字母
    case hasLowerCase = "[a-z]+"
    
    /// 小写字母 - 只包含小写字母
    case allLowerCase = "^[a-z]+$"
    
    /// 大写字母 - 包含大写字母
    case hasUpperCase = "[A-Z]+"
    
    /// 大写字母 - 只包含大写字母
    case allUpperCase = "^[A-Z]+$"
    
    /// 字母 - 包含字母
    case hasLetter = "[A-Za-z]+"
    
    /// 字母 - 只包含字母
    case allLetter = "^[A-Za-z]+$"
    
    /// 数字和字母 - 包含数字或字母
    case hasNumberLetter = "[A-Za-z\\d]+"
    
    /// 数字和字母 - 同时包含数字和密码
    case bothNumberLetter = "^(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{2,}$"
    
    /// 表情符 - 包含表情符
    case hasEmoji = "[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]+"
    
    /// 表情符 - 只包含表情符
    case allEmoji = "^[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]+$"
    
    /// 中文 - 包含中文
    case hasChinese = "[\\u4E00-\\u9FA5]+"
    /// 中文 - 只包含中文
    case allChinese = "^[\\u4E00-\\u9FA5]+$"
    
    /// 限制输入： 只允许输入数字、字母、中文字符、九宫格输入法(➋➌➍➎➏➐➑➒)、·•、限制 1-30，应用场景：用户名
    case limitInput1 = "^[·•➋➌➍➎➏➐➑➒A-Za-z0-9\\u4E00-\\u9FA5]{1,30}$"
    
    /// 限制输入： 只允许输入 0-9和xX的字符，应用场景：身份证号
    case limitInput2 = "^[0-9xX]+$"
}

extension String: XLCompatible { }

// MARK: - 正则匹配

public extension XL where Base == String {
    
    /// 字符串参数
    func isMatch(regularString: String) -> Bool
    {
        return NSRegularExpression.xl.isMatch(string: base, pattern: regularString)
    }
    
    // 枚举值参数
    func isMatch(regularString: XLRegularString) -> Bool
    {
        return NSRegularExpression.xl.isMatch(string: base, pattern: regularString.rawValue)
    }
    
    /// 判断手机号
    func isPhoneNumber() -> Bool
    {
        return isMatch(regularString: .phoneNumber)
    }
    
    /// 判断固定电话
    func isTelePhoneNumber() -> Bool
    {
        return isMatch(regularString: .telephoneNumber)
    }
    
    /// 验证码格式
    func isVericationCode() -> Bool
    {
        return isMatch(regularString: .verificationCode)
    }
    
    /// 判断邮箱
    func isEmail() -> Bool
    {
        return isMatch(regularString: .email)
    }
    
    /// 判断用户名
    func isUsername() -> Bool
    {
        return isMatch(regularString: .username)
    }
    
    /// 判断密码
    func isPassword() -> Bool
    {
        return isMatch(regularString: .password)
    }
    
    /// 判断邮政编码
    func isPostalCode() -> Bool
    {
        return isMatch(regularString: .postalCode)
    }
    
    /// 判断身份证号
    func isIDCardNumber() -> Bool
    {
        return isMatch(regularString: .idCardNumber)
    }
    
    /// 是否包含数字的字符串
    func hasNumber() -> Bool
    {
        return isMatch(regularString: .hasNumber)
    }
    
    /// 是否纯数字字符串
    func allNumber() -> Bool
    {
        return isMatch(regularString: .allNumber)
    }
    
    /// 是否包含小写字母的字符串
    func hasLowerCase() -> Bool
    {
        return isMatch(regularString: .hasLowerCase)
    }
    
    /// 是否纯小写字母字符串
    func allLowerCase() -> Bool
    {
        return isMatch(regularString: .allLowerCase)
    }
    
    /// 是否包含大写字母的字符串
    func hasUpperCase() -> Bool
    {
        return isMatch(regularString: .hasUpperCase)
    }
    
    /// 是否纯大写字母字符串
    func allUpperCase() -> Bool
    {
        return isMatch(regularString: .allUpperCase)
    }
    
    /// 是否包含字母的字符串
    func hasLetter() -> Bool
    {
        return isMatch(regularString: .hasLetter)
    }
    
    /// 是否纯字母字符串
    func allLetter() -> Bool
    {
        return isMatch(regularString: .allLetter)
    }
    
    /// 是否包含数字或字母的字符串
    func hasNumberOrLetter() -> Bool
    {
        return isMatch(regularString: .hasNumberLetter)
    }
    
    /// 是否同时包含数字和密码的字符串
    func bothNumberAndLetter() -> Bool
    {
        return isMatch(regularString: .bothNumberLetter)
    }
    
    /// 是否包含表情符
    func hasEmoji() -> Bool
    {
        return isMatch(regularString: .hasEmoji)
    }
    /// 是否包含中文字符
    func hasChinese() -> Bool
    {
        return isMatch(regularString: .hasChinese)
    }
}

// MARK: - 计算字符串的宽高

public extension XL where Base == String {
    
    /// 根据固定宽度和字体，计算字符串的高度
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let frame = (base as NSString).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        return frame.height
    }
    
    /// 根据固定高度和字体，计算字符串的宽度
    func width(height: CGFloat, font: UIFont) -> CGFloat {
        let frame = (base as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        return frame.width
    }
    
}

// MARK: - 给字符串添加下标索引存取功能

public extension XL where Base == String {
    
    subscript(index: Int) -> String {
        get {
            return String(base[base.index(base.startIndex, offsetBy: index)])
        }
        set {
            let tmp = base
            base = ""
            for (idx, item) in tmp.enumerated() {
                if idx == index {
                    base += "\(newValue)"
                }else{
                    base += "\(item)"
                }
            }
        }
    }
    
    /// 根据开始位置和长度截取字符串
    func subString(start: Int, length: Int = -1) -> String {
        var len = length
        if len == -1 {
            len = base.count - start
        }
        let st = base.index(base.startIndex, offsetBy: start)
        let en = base.index(st, offsetBy: len)
        return String(base[st ..< en])
    }
}

// MARK: - 字符串转Date

public extension XL where Base == String {
    
    func convertDate(format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let date = formatter.date(from: base)
        if date == nil {
            print("时间转换失败...")
            return Date()
        }
        return date!
    }
}

// MARK: - 字符串下标索引功能

public extension String {
    
    /// 给字符串添加下标索引存取功能
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        set {
            let tmp = self
            self = ""
            for (idx, item) in tmp.enumerated() {
                if idx == index {
                    self += "\(newValue)"
                }else{
                    self += "\(item)"
                }
            }
        }
    }
    
    /// 根据开始位置和长度截取字符串
    func subString(start: Int, length: Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy: start)
        let en = self.index(st, offsetBy: len)
        return String(self[st ..< en])
    }
}

