//
//  String+Extension.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

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
 */

// MARK: 正则字符串

public enum XLRegularString: String
{
    /// 手机号格式 - 只允许数字，示例：13512345678
    case phoneNumber = "^(1)(\\d{10})$"
    
    /// 固定电话格式 - 只允许数字，示例：075511223344 或 02011223344
    case telephoneNumber = "^(0)(\\d{2,3})(\\d{7,8})$"
    
    /// 验证码格式 - 只允许数字，示例：1234 或 123456 （4位或6位的验证码）
    case verificationCode = "^(\\d{4}|\\d{6})$"
    
    /// 邮箱格式 - 只允许英文字母、数字、下划线、英文句号、以及中划线组成 y-30@qq.com
    case email = "^([A-Za-z0-9_-]+)(@)([A-Za-z0-9]+)(\\.)([A-Za-z0-9]+)$"
    
    /// 用户名格式 - 只允许使用字母、数字、下滑线、横杠，3~20位
    case username = "^[A-Za-z0-9_-]{3,20}$"
    
    /*
     ^(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{6,20}$
     
     ^ 匹配一行的开头位置
     (?![0-9]+$) 预测该位置后面不全是数字
     (?![A-Za-z]+$) 预测该位置后面不全是字母
     [A-Za-z0-9] {6,20} 由6-20位数字或字母组成
     $ 匹配行尾位置
     */
    
    /// 密码格式 - 只允许字母和数字组合的密码，6~20位
    case password = "^(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{6,20}$"
    
    /// 邮政编码格式 - 只允许由6位数字组成
    case postalCode = "^\\d{6}$"
    
    /// 身份证号格式 - 15位或18位的身份证号
    case idCardNumber = "^(\\d{14}|\\d{17})([\\dxX])$"
    
    /// 数字 - 包含数字
    case hasNumber = "[0-9]+"
    
    /// 数字 - 只包含数字
    case allNumber = "^[0-9]+$"
    
    /// 小写字母 - 包含小写字母
    case hasLowerCase = "[a-z]+"
    
    /// 小写字母 - 只包含小写字母
    case allLowerCase = "^[a-z]+$"
    
    /// 大写字母 - 包含大写字母
    case hasUpperCase = "[A-Z]+"
    
    /// 大写字母 - 只包含大写字母
    case allUpperCase = "^[A-Z]+$"
    
    /// 数字和字母 - 包含可能只有数字、可能只有字母、也可能字母和数字都有
    case hasNumberLetter = "[A-Za-z0-9]+"
    
    /// 数字和字母 - 同时包含字母和数字
    case bothNumberLetter = "(?![0-9]+$)(?![A-Za-z]+$)[A-Za-z0-9]{2,}"
}

public extension String
{
    /// 字符串参数
    func xl_isMatch(regularString: String) -> Bool
    {
        return NSRegularExpression.xl_isMatch(string: self, pattern: regularString)
    }
    
    // 枚举值参数
    func xl_isMatch(regularString: XLRegularString) -> Bool
    {
        return NSRegularExpression.xl_isMatch(string: self, pattern: regularString.rawValue)
    }
    
    /// 判断手机号
    func xl_isPhoneNumber() -> Bool
    {
        return xl_isMatch(regularString: .phoneNumber)
    }
    
    /// 判断固定电话
    func xl_isTelePhoneNumber() -> Bool
    {
        return xl_isMatch(regularString: .telephoneNumber)
    }
    
    /// 验证码格式
    func xl_isVericationCode() -> Bool
    {
        return xl_isMatch(regularString: .verificationCode)
    }
    
    /// 判断邮箱
    func xl_isEmail() -> Bool
    {
        return xl_isMatch(regularString: .email)
    }
    
    /// 判断用户名
    func xl_isUsername() -> Bool
    {
        return xl_isMatch(regularString: .username)
    }
    
    /// 判断密码
    func xl_isPasswork() -> Bool
    {
        return xl_isMatch(regularString: .password)
    }
    
    /// 判断邮政编码
    func xl_isPostalCode() -> Bool
    {
        return xl_isMatch(regularString: .postalCode)
    }
    
    /// 判断身份证号
    func xl_isIDCardNumber() -> Bool
    {
        return xl_isMatch(regularString: .idCardNumber)
    }
}
