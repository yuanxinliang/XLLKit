//
//  GlobeConstant.swift
//  Pods-XLLKit_Example
//
//  Created by ZZCMXL on 2019/5/30.
//

import Foundation
import CoreTelephony

// MARK: --<屏幕相关尺寸和宽高值>--

public struct Screen { }

extension Screen: XLCompatible { }

public extension XL where Base == Screen {
    
    /// 屏幕宽度
    static var width: CGFloat { return UIScreen.main.bounds.width }
    
    /// 屏幕高度
    static var height: CGFloat { return UIScreen.main.bounds.height }
    
    /*
     * width = 320, height = 480      640 x 960      3.5吋（iPhone 4S）
     * width = 320, height = 568      640 x 1136     4.0吋（iPhone SE）
     * width = 375, height = 667      750 x 1334     4.7吋（iPhone 8）
     * width = 414, height = 736     1080 x 1920     5.5吋（iPhone 8 Plus）
     * width = 375, height = 812     1125 x 2436     5.8吋（iPhone X、iPhone XS）
     * width = 414, height = 896      828 x 1792     6.1吋（iPhone XR）
     * width = 414, height = 896     1242 x 2688     6.5吋（iPhone XS Max）
     */
    
    /// 3.5英寸屏幕
    static var isInch_3_5: Bool { return width == 320 && height == 480 }
    
    /// 4.0英寸屏幕
    static var isInch_4_0: Bool { return width == 320 && height == 568 }
    
    /// 4.7英寸屏幕
    static var isInch_4_7: Bool { return width == 375 && height == 667 }
    
    /// 5.5英寸屏幕
    static var isInch_5_5: Bool { return width == 414 && height == 736 }
    
    /// 5.8英寸屏幕
    static var isInch_5_8: Bool { return width == 375 && height == 812 }
    
    /// 6.1英寸屏幕
    static var isInch_6_1: Bool { return width == 414 && height == 896 }
    
    /// 6.5英寸屏幕
    static var isInch_6_5: Bool { return width == 414 && height == 896 }
    
    /// 是否全面屏
    static var isFullScreen: Bool { return isInch_5_8 || isInch_6_1 || isInch_6_5 }
    
    /// 状态栏高度
    static var heightOfStatusBar: CGFloat { return isFullScreen ? 44 : 20 }
    
    /// 导航栏高度
    static var heightOfNavigationBar: CGFloat { return isFullScreen ? 88 : 64 }
    
    /// 底部安全区域高度
    static var heightOfBottomSafeAere: CGFloat { return isFullScreen ? 34 : 0 }
    
    /// 底部分栏高度
    static var heightOfTabBar: CGFloat { return isFullScreen ? 83 : 49 }
    
    /// 宽度比例 -- 以375的宽度为基准
    static var widthRatio: CGFloat { return width / 375.0 }
    
    /// 高度比例 -- 以667的高度为基准
    static var heightRatio: CGFloat { return height / 667.0 }
    
    /// 按比例计算宽度值：等比宽度
    static func w(_ width: CGFloat) -> CGFloat { return widthRatio < 1 ? (widthRatio * width) : width }
    
    /// 按比例计算高度值：等比高度
    static func h(_ height: CGFloat) -> CGFloat { return heightRatio < 1 ? (heightRatio * height) : height }
    
}

// MARK: --<App应用信息>--

public struct AppInfo { }

extension AppInfo: XLCompatible { }

public extension XL where Base == AppInfo {
    
    /// APP 名称
    static var name: String { return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String }
    
    /// APP 版本号
    static var version: String { return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String }
    
    /// APP Build号
    static var build: String { return Bundle.main.infoDictionary!["CFBundleVersion"] as! String }
    
    /// APP Bundle ID
    static var bundleID: String { return Bundle.main.bundleIdentifier! }
}

// MARK: --<手机设备使用信息>--

public struct DeviceInfo { }

extension DeviceInfo: XLCompatible { }

public extension XL where Base == DeviceInfo {
    
    /// 手机别名 e.g. "My iPhone"
    static var name: String { return UIDevice.current.name }
    
    /// 手机类型 - e.g. @"iPhone", @"iPod touch"
    static var model: String { return UIDevice.current.model }
    
    /// 手机本地化类型 - localized version of model
    static var localizedModel: String { return UIDevice.current.localizedModel }
    
    /// 系统名称 - e.g. @"iOS"
    static var systemName: String { return UIDevice.current.systemName }
    
    /// 系统版本 - e.g. @"4.0"
    static var systemVersion: String { return UIDevice.current.systemVersion }
    
    /// 电池电量 - 0 .. 1.0. -1.0 if UIDeviceBatteryStateUnknown
    static var batteryLevel: Float { return UIDevice.current.batteryLevel }
    
}

// MARK: --<手机设备硬件、内存等信息>--

public extension XL where Base == DeviceInfo {
    
    /// 容量 - e.g. 64、128
    static var sizeOfDisk: Int {
        var fs: statfs = statfs()
        var size: Int = -1
        if statfs("/var", &fs) >= 0 {
            size = Int(UInt64(fs.f_bsize) * fs.f_blocks / (1024 * 1024 * 1024))
            switch size {
            case 0...16:
                size = 16
            case 17...32:
                size = 32
            case 33...64:
                size = 64
            case 65...128:
                size = 128
            case 129...256:
                size = 256
            case 257...512:
                size = 512
            case 513...1024:
                size = 1024
            default:
                break
            }
        }
        return size
    }
    
    /// 总容量 - 实际容量
    static var totalSizeOfDisk: Int {
        var fs: statfs = statfs()
        var size: Int = -1
        if statfs("/var", &fs) >= 0 {
            size = Int(UInt64(fs.f_bsize) * fs.f_blocks)
        }
        return size
    }
    
    /// 可用容量
    static var availSizeOfDisk: Int {
        var fs: statfs = statfs()
        var size: Int = -1
        if statfs("/var", &fs) >= 0 {
            size = Int(UInt64(fs.f_bsize) * fs.f_bavail)
        }
        return size
    }
    
    /// 容量转换
    static func fileSizeToString(_ size: Int) -> String {
        
        let KB = 1024
        let MB = KB*KB
        let GB = MB*KB
        var value: String = ""
        
        switch size {
        case 0...10:
            value = "0 B"
        case 11..<KB:
            value = "< 1 KB"
        case KB..<MB:
            value = String(format: "%.1f KB", Float(size) / Float(KB) )
        case MB..<GB:
            value = String(format: "%.1f MB", Float(size) / Float(MB) )
        default:
            value = String(format: "%.1f GB", Float(size) / Float(GB) )
        }
        return value
    }
    
    /// 手机型号 - e.g. @"iPhone 6"
    /// 型号参考苹果官方：https://www.theiphonewiki.com/wiki/Models
    static var deviceModel: String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machine = Mirror(reflecting: systemInfo.machine)
        let identifier = machine.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
            
            // MARK: - iPhone
            
            case "iPhone3,1":   return "iPhone 4"
            case "iPhone3,2":   return "iPhone 4"
            case "iPhone3,3":   return "iPhone 4"
            case "iPhone4,1":   return "iPhone 4s"
            case "iPhone5,1":   return "iPhone 5"
            case "iPhone5,2":   return "iPhone 5"
            case "iPhone5,3":   return "iPhone 5c"
            case "iPhone5,4":   return "iPhone 5c"
            case "iPhone6,1":   return "iPhone 5s"
            case "iPhone6,2":   return "iPhone 5s"
            case "iPhone7,1":   return "iPhone 6 Plus"
            case "iPhone7,2":   return "iPhone 6"
            case "iPhone8,1":   return "iPhone 6s"
            case "iPhone8,2":   return "iPhone 6s Plus"
            case "iPhone8,4":   return "iPhone SE"
            case "iPhone9,1":   return "iPhone 7"
            case "iPhone9,3":   return "iPhone 7"
            case "iPhone9,2":   return "iPhone 7 Plus"
            case "iPhone9,4":   return "iPhone 7 Plus"
            case "iPhone10,1":  return "iPhone 8"
            case "iPhone10,4":  return "iPhone 8"
            case "iPhone10,2":  return "iPhone 8 Plus"
            case "iPhone10,5":  return "iPhone 8 Plus"
            case "iPhone10,3":  return "iPhone X"
            case "iPhone10,6":  return "iPhone X"
            case "iPhone11,8":  return "iPhone XR"
            case "iPhone11,2":  return "iPhone XS"
            case "iPhone11,6":  return "iPhone XS Max"
            
            // MARK: - iPad
            
            case "iPad1,1":     return "iPad"
            case "iPad1,2":     return "iPad 3G"
            case "iPad2,1":     return "iPad 2 (WiFi)"
            case "iPad2,2":     return "iPad 2"
            case "iPad2,3":     return "iPad 2 (CDMA)"
            case "iPad2,4":     return "iPad 2"
            case "iPad2,5":     return "iPad Mini (WiFi)"
            case "iPad2,6":     return "iPad Mini"
            case "iPad2,7":     return "iPad Mini (GSM+CDMA)"
            case "iPad3,1":     return "iPad 3 (WiFi)"
            case "iPad3,2":     return "iPad 3 (GSM+CDMA)"
            case "iPad3,3":     return "iPad 3"
            case "iPad3,4":     return "iPad 4 (WiFi)"
            case "iPad3,5":     return "iPad 4"
            case "iPad3,6":     return "iPad 4 (GSM+CDMA)"
            case "iPad4,1":     return "iPad Air (WiFi)"
            case "iPad4,2":     return "iPad Air (Cellular)"
            case "iPad4,4":     return "iPad Mini 2 (WiFi)"
            case "iPad4,5":     return "iPad Mini 2 (Cellular)"
            case "iPad4,6":     return "iPad Mini 2"
            case "iPad4,7":     return "iPad Mini 3"
            case "iPad4,8":     return "iPad Mini 3"
            case "iPad4,9":     return "iPad Mini 3"
            case "iPad5,1":     return "iPad Mini 4 (WiFi)"
            case "iPad5,2":     return "iPad Mini 4 (LTE)"
            case "iPad5,3":     return "iPad Air 2"
            case "iPad5,4":     return "iPad Air 2"
            case "iPad6,3":     return "iPad Pro 9.7"
            case "iPad6,4":     return "iPad Pro 9.7"
            case "iPad6,7":     return "iPad Pro 12.9"
            case "iPad6,8":     return "iPad Pro 12.9"
            case "iPad6,11":    return "iPad 5 (WiFi)"
            case "iPad6,12":    return "iPad 5 (Cellular)"
            case "iPad7,1":     return "iPad Pro 12.9 inch 2nd gen (WiFi)"
            case "iPad7,2":     return "iPad Pro 12.9 inch 2nd gen (Cellular)"
            case "iPad7,3":     return "iPad Pro 10.5 inch (WiFi)"
            case "iPad7,4":     return "iPad Pro 10.5 inch (Cellular)"
            case "iPad7,5":     return "iPad (6th generation)"
            case "iPad7,6":     return "iPad (6th generation)"
            case "iPad8,1":     return "iPad Pro (11-inch)"
            case "iPad8,2":     return "iPad Pro (11-inch)"
            case "iPad8,3":     return "iPad Pro (11-inch)"
            case "iPad8,4":     return "iPad Pro (11-inch)"
            case "iPad8,5":     return "iPad Pro (12.9-inch) (3rd generation)"
            case "iPad8,6":     return "iPad Pro (12.9-inch) (3rd generation)"
            case "iPad8,7":     return "iPad Pro (12.9-inch) (3rd generation)"
            case "iPad8,8":     return "iPad Pro (12.9-inch) (3rd generation)"
            
            // MARK: -  Apple Watch
            
            case "Watch1,1":    return "Apple Watch (1st generation)"
            case "Watch1,2":    return "Apple Watch (1st generation)"
            case "Watch2,6":    return "Apple Watch Series 1"
            case "Watch2,7":    return "Apple Watch Series 1"
            case "Watch2,3":    return "Apple Watch Series 2"
            case "Watch2,4":    return "Apple Watch Series 2"
            case "Watch3,1":    return "Apple Watch Series 3"
            case "Watch3,2":    return "Apple Watch Series 3"
            case "Watch3,3":    return "Apple Watch Series 3"
            case "Watch3,4":    return "Apple Watch Series 3"
            case "Watch4,1":    return "Apple Watch Series 4"
            case "Watch4,2":    return "Apple Watch Series 4"
            case "Watch4,3":    return "Apple Watch Series 4"
            case "Watch4,4":    return "Apple Watch Series 4"
            
            // MARK: -  AppleTV
            
            case "AppleTV2,1":  return "Apple TV 2"
            case "AppleTV3,1":  return "Apple TV 3"
            case "AppleTV3,2":  return "Apple TV 3"
            case "AppleTV5,3":  return "Apple TV 4"
            case "AppleTV6,2":  return "Apple TV 4K"
            
            // MARK: -  AirPods
            
            case "AirPods1,1":  return "AirPods (1st generation)"
            case "AirPods2,1":  return "AirPods (2nd generation)"
            
            // MARK: - Simulator
            
            case "i386":        return "iPhone Simulator i386"
            case "x86_64":      return "iPhone Simulator x86_64"
            
            default:            return identifier
        }
    }
    
    /// ip
    static var ip: String {
        var addresses = [String]()
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while (ptr != nil) {
                let flags = Int32(ptr!.pointee.ifa_flags)
                var addr = ptr!.pointee.ifa_addr.pointee
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            if let address = String(validatingUTF8:hostname) {
                                addresses.append(address)
                            }
                        }
                    }
                }
                ptr = ptr!.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }
        if let ipStr = addresses.first {
            return ipStr
        } else {
            return ""
        }
    }
    
    /// 手机卡运营商
    static var phoneCardModel: String {
        let info = CTTelephonyNetworkInfo()
        var supplier:String = ""
        if #available(iOS 12.0, *) {
            if let carriers = info.serviceSubscriberCellularProviders {
                if carriers.keys.count == 0 {
                    return "无手机卡"
                } else { //获取运营商信息
                    for (index, carrier) in carriers.values.enumerated() {
                        guard carrier.carrierName != nil else { return "无手机卡" }
                        //查看运营商信息 通过CTCarrier类
                        if index == 0 {
                            supplier = carrier.carrierName!
                        } else {
                            supplier = supplier + "," + carrier.carrierName!
                        }
                    }
                    return supplier
                }
            } else{
                return "无手机卡"
            }
        } else {
            if let carrier = info.subscriberCellularProvider {
                guard carrier.carrierName != nil else { return "无手机卡" }
                return carrier.carrierName!
            } else{
                return "无手机卡"
            }
        }
    }
    
    /// cpu核数
    static var countOfCpu: Int {
        var ncpu: UInt = UInt(0)
        var len: size_t = MemoryLayout.size(ofValue: ncpu)
        sysctlbyname("hw.ncpu", &ncpu, &len, nil, 0)
        return Int(ncpu)
    }
    
    /// cpu类型
    static var modelOfCpu: String {
        let HOST_BASIC_INFO_COUNT = MemoryLayout<host_basic_info>.stride/MemoryLayout<integer_t>.stride
        var size = mach_msg_type_number_t(HOST_BASIC_INFO_COUNT)
        var hostInfo = host_basic_info()
        _ = withUnsafeMutablePointer(to: &hostInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity:Int(size)){
                host_info(mach_host_self(), Int32(HOST_BASIC_INFO), $0, &size)
            }
        }
        // print(hostInfo)
        switch hostInfo.cpu_type {
            case CPU_TYPE_ARM:
                return "CPU_TYPE_ARM"
            case CPU_TYPE_ARM64:
                return "CPU_TYPE_ARM64"
            case CPU_TYPE_ARM64_32:
                return"CPU_TYPE_ARM64_32"
            case CPU_TYPE_X86:
                return "CPU_TYPE_X86"
            case CPU_TYPE_X86_64:
                return"CPU_TYPE_X86_64"
            case CPU_TYPE_ANY:
                return"CPU_TYPE_ANY"
            case CPU_TYPE_VAX:
                return"CPU_TYPE_VAX"
            case CPU_TYPE_MC680x0:
                return"CPU_TYPE_MC680x0"
            case CPU_TYPE_I386:
                return"CPU_TYPE_I386"
            case CPU_TYPE_MC98000:
                return"CPU_TYPE_MC98000"
            case CPU_TYPE_HPPA:
                return"CPU_TYPE_HPPA"
            case CPU_TYPE_MC88000:
                return"CPU_TYPE_MC88000"
            case CPU_TYPE_SPARC:
                return"CPU_TYPE_SPARC"
            case CPU_TYPE_I860:
                return"CPU_TYPE_I860"
            case CPU_TYPE_POWERPC:
                return"CPU_TYPE_POWERPC"
            case CPU_TYPE_POWERPC64:
                return"CPU_TYPE_POWERPC64"
            default:
                return ""
        }
    }
    
}
