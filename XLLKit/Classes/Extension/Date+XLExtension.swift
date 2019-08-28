//
//  Date+XLExtension.swift
//  XLLKit
//
//  Created by XL ZZCM on 2019/8/22.
//

import Foundation

extension Date: XLCompatible { }

// MARK: - 类方法

public extension XL where Base == Date {
    
    /// 根据时间成分获取日期date
    static func date(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date {
        // 设置时间成分
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        // 创建一个转换桥梁
        let calendar = Calendar.current
        return calendar.date(from: components)!
    }
    
    /// 根据date获取时间成分
    static func dateComponents(date: Date) -> DateComponents {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday, .nanosecond], from: date)
        return components
    }
    
    /// 获取yyyy-MM-dd 00:00:00的时间
    static func date(date: Date) -> Date {
        let str = date.xl.convertString(format: "yyyy-MM-dd 00:00:00")
        return str.xl.convertDate()
    }
}

// MARK: - 实例方法

public extension XL where Base == Date {
    
    /// 时间格式化
    func convertString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let str = formatter.string(from: base)
        return str
    }
    
    /// 获取yyyy-MM-dd 00:00:00的时间
    func date() -> Date {
        return Date.xl.date(date: base)
    }
    
    /// 获取某个月的总天数
    func daysOfMonth() -> Int {
        let calendar = Calendar.current
        let range = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: base)
        return range!.count
    }
    
    /// 根据date获取时间成分
    func dateComponents() -> DateComponents {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday, .nanosecond], from: base)
        return components
    }
    
    /// 获取当天是周几
    func weekday() -> Int {
        let comp = dateComponents()
        return comp.weekday!
    }
    
    /// 获取当前日期本周内周一的日期
    func monday() -> Date {
        var da = date()
        let we = weekday()
        switch we {
        /// 周日
        case 1:
            da = getBeforeOrLaterDay(day: -6)
        /// 周二
        case 3:
            da = getBeforeOrLaterDay(day: -1)
        /// 周三
        case 4:
            da = getBeforeOrLaterDay(day: -2)
        /// 周四
        case 5:
            da = getBeforeOrLaterDay(day: -3)
        /// 周五
        case 6:
            da = getBeforeOrLaterDay(day: -4)
        /// 周六
        case 7:
            da = getBeforeOrLaterDay(day: -5)
        default:
            break
        }
        return da
    }
    
    /// 获取当前日期月份的一号日期
    func firstDayOfMonth() -> Date {
        let str = convertString(format: "yyyy-MM-01 00:00:00")
        return str.xl.convertDate()
    }
    
    /// 获取上、当前、下年的日期
    ///
    /// - Parameter year: -1：上一年，1：下一年
    /// - Returns: 时间
    func getBeforeOrLateYear(year: Int) -> Date {
        var comp = DateComponents()
        comp.year = year
        let calender = Calendar.current
        let date = calender.date(byAdding: comp, to: base)
        return date!
    }
    
    /// 获取上、当前、下个月的日期
    ///
    /// - Parameter month: -1：上个月，1：下个月
    /// - Returns: 时间
    func getBeforeOrLaterMonth(month: Int) -> Date {
        var comp = DateComponents()
        comp.month = month
        let calender = Calendar.current
        let date = calender.date(byAdding: comp, to: base)
        return date!
    }
    
    /// 获取上、当前、下个周的日期
    ///
    /// - Parameter week: -1：上周，1：下周
    /// - Returns: 时间
    func getBeforeOrLaterWeek(week: Int) -> Date {
        var comp = DateComponents()
        comp.weekOfYear = week
        let calender = Calendar.current
        let date = calender.date(byAdding: comp, to: base)
        return date!
    }
    
    /// 获取上、当前、下天的日期
    ///
    /// - Parameter week: -1：上某天，1：下某天
    /// - Returns: 时间
    func getBeforeOrLaterDay(day: Int) -> Date {
        var comp = DateComponents()
        comp.day = day
        let calender = Calendar.current
        let date = calender.date(byAdding: comp, to: base)
        return date!
    }
}
