//
//  Macro.swift
//  AV-Foundation
//
//  Created by ZXL on 2018/2/12.
//  Copyright © 2018年 ZXL. All rights reserved.
//

import Foundation
import UIKit
///--------------------------------------------------
/// SCREEN VERSION
///--------------------------------------------------
// 当前系统版本
let kVersion = (UIDevice.current.systemVersion as NSString).floatValue
func IOS_VERSION_9_OR_LATER(_ v:String) -> Bool {
    return (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_9_0)
}
func IOS_VERSION_10_OR_LATER(_ v:String) -> Bool {
    return (NSFoundationVersionNumber >= NSFoundationVersionNumber10_0)
}
func SYSTEM_VERSION_AtLeast(_ majorV:Int,_ minorV:Int) -> Bool {
    return ProcessInfo.processInfo.isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: majorV, minorVersion: minorV, patchVersion: 0))
}
// 屏幕宽高
let kScreenHeight = UIScreen.main.bounds.height
let kScreenWidth = UIScreen.main.bounds.width
let isIPhone5 = kScreenHeight == 568 ? true : false
let isIPhone6 = kScreenHeight == 667 ? true : false
let isIPhone6P = kScreenHeight == 736 ? true : false
let isIPhoneX = kScreenHeight == 812 ? true : false

let kStatuH:CGFloat = 20
let kNavBarH:CGFloat = isIPhoneX ? 88 : 64
let kTabBarH:CGFloat = isIPhoneX ? 49 + 34 : 49

func WIDTH(_ size:Float) -> CGFloat
{
    return CGFloat(size / 375.0 * Float(UIScreen.main.bounds.size.width))
}
func HEIGHT(_ size:Float) -> CGFloat
{
    return CGFloat(size / 667.0 * Float(UIScreen.main.bounds.size.height))
}

///--------------------------------------------------
/// COLORS
///--------------------------------------------------
// MARK:- 颜色方法
func RGBAColor (_ r:CGFloat, _ g:CGFloat, _ b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

// MARK:- 随机颜色
func randomColor() -> UIColor {
    let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
    let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    return UIColor.init(red:red, green:green, blue:blue , alpha: 1)
}
