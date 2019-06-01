//
//  NSRegularExpression+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by XL Yuen on 2019/6/1.
//

// MARK: 检索 - Matching
public extension NSRegularExpression
{
    class func xl_isMatch(string: String, pattern: String) -> Bool
    {
        return xl_isMatch(string: string, pattern: pattern, ignoreCase: false)
    }
    
    class func xl_isMatch(string: String, pattern: String, ignoreCase: Bool) -> Bool
    {
        var isMatch = false
        do {
            // 正则匹配选项
            let options: NSRegularExpression.Options = ignoreCase ? [NSRegularExpression.Options.caseInsensitive] : []
            let regular = try NSRegularExpression(pattern: pattern, options: options)
            let range = NSRange(location: 0, length: string.count)
            let numbers = regular.numberOfMatches(in: string, options: [], range: range)
            isMatch = numbers > 0 ? true : false
        } catch {
            isMatch = false
            print(error)
        }
        return isMatch
    }
}

// MARK: 替换 - Replacement
public extension NSRegularExpression
{
    
}
