//
//  AppDelegate.swift
//  UITestExample
//
//  Created by tamaki on 8/27/16.
//  Copyright © 2016 tamaki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appStatus: AppStatusType?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let arguments = NSProcessInfo.processInfo().arguments
        debugPrint(arguments)
        //RootViewControllerを起動時の引数として渡している場合に処理する。
        if let rootVcOptionIndex = arguments.indexOf("-rootViewController") {
            //起動するViewControllerのIDを取得します。
            let rootVcId = arguments[rootVcOptionIndex+1]
            if rootVcId.isEmpty == false {
                //ストーリーボードからViewControllerを取得してrootViewControlerに設定
                if let vc: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(rootVcId) {
                    self.window?.rootViewController = vc;
                }
            }
        }
        
        if let appStatusOptionIndex = arguments.indexOf("-appStatus") {
            let status = arguments[appStatusOptionIndex+1]
            if status.isEmpty == false {
                self.appStatus = AppStatusType(rawValue: status)
            }
        }

        if self.appStatus == nil {
            self.appStatus = AppStatusType.LOGOUT
        }

        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

