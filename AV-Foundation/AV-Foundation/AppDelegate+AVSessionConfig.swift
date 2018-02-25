//
//  AppDelegate+AVSessionConfig.swift
//  AV-Foundation
//
//  Created by ZXL on 2018/2/12.
//  Copyright © 2018年 ZXL. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension AppDelegate {
    func session_application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
        // 配置音频会话
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioSession.setActive(true)
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
