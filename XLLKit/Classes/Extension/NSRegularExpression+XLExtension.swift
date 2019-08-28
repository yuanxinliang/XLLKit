//
//  NSRegularExpression+XLExtension.swift
//  Pods-XLLKit_Example
//
//  Created by XL Yuen on 2019/6/1.
//

extension NSRegularExpression: XLCompatible { }

// MARK: - 匹配 - Matching

public extension XL where Base: NSRegularExpression {
    
    static func isMatch(string: String, pattern: String) -> Bool {
        return isMatch(string: string, pattern: pattern, ignoreCase: false)
    }
    
    static func isMatch(string: String, pattern: String, ignoreCase: Bool) -> Bool {
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

// MARK: - 替换 - Replacement

public extension XL where Base: NSRegularExpression {
    
    static func replacement(string: String, replace: String, pattern: String) -> String
    {
        var value = string
        do {
            let regular = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(location: 0, length: string.count)
            value = regular.stringByReplacingMatches(in: string, options: [], range: range, withTemplate: replace)
        } catch {
            print(error)
        }
        return value
    }
}
