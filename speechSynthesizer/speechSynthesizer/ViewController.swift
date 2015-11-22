//
//  ViewController.swift
//  speechSynthesizer
//
//  Created by Shohei Komura on 2015/11/22.
//  Copyright © 2015年 Shohei Komura. All rights reserved.
//

import UIKit
//音楽の再生とかできるフレームワーク
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    var tf = UITextField(frame: CGRectMake(60, 200, 200, 40))
    
    func setup(){
        self.view.backgroundColor = UIColor.hexStr("#F5F5F5", alpha: 1)
        //viewのタップイベントを検知する
        self.view.userInteractionEnabled = true
        
        self.setLabel()
        self.setTextField()
        self.setButton()
    }
    
    func setLabel(){
        //ラベルを作る
        let label = UILabel(frame:CGRectMake(70, 150, 200, 40))
        //ラベルのテキストの指定
        label.text = "テキストを入力してね"
        //ラベルのテキストの色を指定
        label.textColor = UIColor.hexStr("#16A6B6", alpha: 1)
        //ラベルのフォントの指定
        label.font = UIFont(name: "HiraKakuProN-W3", size: 18)
        //ラベルを画面に追加
        self.view.addSubview(label)
    }
    
    func setTextField(){
        // 枠を表示する.
        tf.borderStyle = UITextBorderStyle.RoundedRect
        tf.delegate = self
        //テキストフィールドを画面に追加する
        self.view.addSubview(tf)
    }
    
    func setButton(){
        
        //ボタンを生成
        let button : UIButton = UIButton(type: UIButtonType.Custom)
        //ボタンに画像を指定
        button.setImage(UIImage(named: "speakerIcon180"), forState: UIControlState.Normal)
        //ボタンのフーレムを指定
        button.frame = CGRectMake(115, 280, 90, 90)
        //ボタンの枠を丸くする
        button.layer.masksToBounds = true
        // コーナーの半径を指定
        button.layer.cornerRadius = 40.0
        //ボタンが押されたら呼ぶメソッドの指定
        button.addTarget(self, action: "tapButton", forControlEvents: UIControlEvents.TouchUpInside )
        //ボタンを画面に追加する
        self.view.addSubview(button)
    }
    
    
    func tapButton(){
        let talker = AVSpeechSynthesizer()
        //話す内容を指定
        let utterance = AVSpeechUtterance(string: self.tf.text!)
        //言語を日本語に指定
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        //話す速度を設定(0.0~1.0)
        utterance.rate = AVSpeechUtteranceMinimumSpeechRate
        //声の高さを設定(0.5~2.0)
        utterance.pitchMultiplier = 1.0
        
        hideKeyBoard()
        
        //実行
        talker.speakUtterance(utterance)
        
    }
    
    private func hideKeyBoard(){
        tf.resignFirstResponder()
        
    }
    
    
    //タッチされたら呼ばれるメソッド
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideKeyBoard()
        
    }
    
    // MARK: UITextFieldDelegate
    //UITextFieldが編集された直後に呼ばれる
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    //UITextFieldが編集終了する直前に呼ばれる
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    
    //改行ボタンが押された際に呼ばれる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //キーボードを消す
        textField.resignFirstResponder()
        
        return true
    }
    
}

