//
//  AppDelegate.swift
//  HomeQuickActionDemo
//
//  Created by William Wong on 29/12/2015.
//  Copyright © 2015 Fleetmatics. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        var shouldPerformAdditionalDelegateHandling = true
        
        // If a shortcut was launched, display its information and take the appropriate action
        if let _ = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            
            // This will block "performActionForShortcutItem:completionHandler" from being called.
            shouldPerformAdditionalDelegateHandling = false
        }
        
        if ((self.window?.traitCollection.forceTouchCapability) == UIForceTouchCapability.Available) {
            let historyIcon = UIApplicationShortcutIcon.init(type: .Add)
            let historyItem = UIApplicationShortcutItem.init(type: "history", localizedTitle: "History from code", localizedSubtitle:nil, icon: historyIcon, userInfo: nil)
            
            let downloadIcon = UIApplicationShortcutIcon.init(type: .Audio)
            let downloadItem = UIApplicationShortcutItem.init(type: "download", localizedTitle: "Download from code", localizedSubtitle: nil, icon: downloadIcon, userInfo: nil)
            
            let additionalIcon = UIApplicationShortcutIcon.init(type: .Bookmark)
            let additionalItem = UIApplicationShortcutItem.init(type: "addition", localizedTitle: "Addition from code", localizedSubtitle: nil, icon: additionalIcon, userInfo: nil)
            
            //application.shortcutItems = [historyItem, downloadItem]
            application.shortcutItems = [historyItem, downloadItem, additionalItem]
        }
        
        
        print("\(shouldPerformAdditionalDelegateHandling)")
        return shouldPerformAdditionalDelegateHandling
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

    
    //Quick Action item click callback
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        //we can use   shortcutItem.type  &   shortcutItem.userinfo     to handle different event
        
        //only when your app is activated and in background, this would conditionally called, indicated by the completionHandler return YES in this case
        
        if shortcutItem.type == "history" {
            print("This is history")
        } else if shortcutItem.type == "download" {
            print("This is Download")
        }
        
        completionHandler(true)
    }
}

