//
//  SpeechViewController.swift
//  AV-Foundation
//
//  Created by ZXL on 2018/2/12.
//  Copyright © 2018年 ZXL. All rights reserved.
//

import UIKit
import AVFoundation

class SpeechViewController: UIViewController {

    var synthesizer:AVSpeechSynthesizer?
    let textField = UITextField(frame: CGRect(x: kScreenWidth * 0.2, y: kScreenHeight * 0.2, width: kScreenWidth * 0.6, height: HEIGHT(38)))
    
    deinit {
        print("\(self) 销毁了")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "AV-Foundation"
        self.view.backgroundColor = RGBAColor(235, 235, 235, a: 1)
        self.synthesizer = AVSpeechSynthesizer()

        textField.placeholder = "请输入字符串"
        textField.backgroundColor = UIColor.white
        view.addSubview(textField)


        let readButton = UIButton(frame: CGRect(x: kScreenWidth * 0.2, y: kScreenHeight * 0.8, width: kScreenWidth * 0.6, height: HEIGHT(38)))
        readButton.backgroundColor = UIColor.orange
        readButton.setTitle("语音播报", for: UIControlState.normal)
        readButton.addTarget(self, action: #selector(SpeechViewController.readAction), for: .touchUpInside)
        view.addSubview(readButton)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        synthesizer = nil
    }
    
    @objc func readAction() {
        if (textField.text?.isEmpty)! == false {
            let utterance = AVSpeechUtterance(string: textField.text!)
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
            utterance.rate = 0.4
            utterance.volume = 0.8
            // 音调  范围(0.5-2.0)
            utterance.pitchMultiplier = 0.1
            utterance.postUtteranceDelay = 0.1
            self.synthesizer?.speak(utterance)
        }
        else{
            let utterance = AVSpeechUtterance(string: "请输入您要说的内容")
            utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
            utterance.rate = 0.4
            utterance.volume = 0.8
            // 音调  范围(0.5-2.0)
            utterance.pitchMultiplier = 0.8
            utterance.postUtteranceDelay = 0.1
            self.synthesizer?.speak(utterance)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
