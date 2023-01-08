//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by 아라 on 2023/01/07.
// 꼼꼼한 재은 씨의 swift 기본편 6장

import UIKit
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    
    //앱이 처음 실행될 때 호출되는 메소드
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 11.0, *) {
            //시스템에서 제공하는 인스턴스 받아오기
            let notiCenter = UNUserNotificationCenter.current()
            //requestAuthorization으로 알림 설정에 대한 동의 받기
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) {
                (didAllow, e) in}
            notiCenter.delegate = self
            
        } else {
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(setting)
        }
        return true
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler([.banner, .list, .badge, .sound])
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup" {
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler()
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}
