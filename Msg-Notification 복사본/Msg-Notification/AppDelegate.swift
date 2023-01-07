//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by 아라 on 2023/01/07.
// 꼼꼼한 재은 씨의 swift 기본편 6장

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    //앱이 처음 실행될 때 호출되는 메소드
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 11.0, *) {
            //시스템에서 제공하는 인스턴스 받아오기
            let notiCenter = UNUserNotificationCenter.current()
            //requestAuthorization으로 알림 설정에 대한 동의 받기
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) {
                (didAllow, e) in }
        } else {
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(setting)
        }
        return true
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
    
    //앱이 활성화 상태를 잃었을 때
    func applicationWillResignActive(_ application: UIApplication) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                //사용자가 알림 받는것에 동의했는지 확인
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    //발송할 내용 정의
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1 //앱 아이콘에 표시될 값 (뱃지)
                    nContent.title = "로컬 알림 메세지"
                    nContent.subtitle = "준비된 내용 짱많 얼른 다시 앱 열어조"
                    nContent.body = "앗! 왜 나갔어요?ㅜ"
                    nContent.sound = UNNotificationSound.default
                    nContent.userInfo = ["name" : "ARa"]
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자가 동의하지 않음")
                }
            }
        }else {
            
        }
    }
    
    
    
}
