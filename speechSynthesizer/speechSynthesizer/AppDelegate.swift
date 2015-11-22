//
//  AppDelegate.swift
//  speechSynthesizer
//
//  Created by Shohei Komura on 2015/11/22.
//  Copyright © 2015年 Shohei Komura. All rights reserved.
//
//UICOLORをHEXCOLOR（WEBカラー）で表示する-----------------
extension UIColor {
    class func hexStr (var hexStr : NSString, alpha : CGFloat) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat((color & 0x0000FF) ) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        }else {
            print("invalid hex string")
            return UIColor.whiteColor()
        }
    }
}
//------------------------------------------------------



import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //ここにletとかvarで定義したやつは「インスタンス変数」といわれるもので、このクラスからどこでも使える
    //色々なところで使いたいやつはインスタンス変数に定義しておく
    var window: UIWindow?
    //画面遷移のための階層構造をつくる
    let navigationController = UINavigationController ()
    
    //アプリが起動したら呼ばれるメソッド
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //windowを画面サイズに合わせて作成する
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        let viewController = ViewController()
        // 階層構造の一番上にトップの画面を入れる
        navigationController.pushViewController(viewController, animated: false)
        //viewControllerのsetupメソッドを呼ぶ
        viewController.setup()
        
        //ナビゲーションバーを隠す。(trueをfalseにして再生すると違いがわかるかも)
        navigationController.setNavigationBarHidden(true, animated: false)
        // iphoneの画面に階層構造を指定
        self.window?.rootViewController = navigationController
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

