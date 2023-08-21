//
//  AppDelegate.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.


        UNUserNotificationCenter.current().delegate = self
        
        //알림 권한 설정
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, error in
            print(success, error)   
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


}

extension AppDelegate: UNUserNotificationCenterDelegate{
    
    //포그라운드 => 친구랑 1:1채팅 / 다른 단톡방, 다른 갠톡방
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //특정 화면, 특정 조건에서만 포그라운드 알림 받기,
        //특정 화면에서는 알림 안 받기
        completionHandler([.sound,.badge,.banner, .list])
        
        //특정 푸시 클릭하면 특정 화면으로 이동
        //알람 갯수 제한 : 64개 제한(identifier
        //카톡: 포그라운드로 앱을 여는 순간, 등록 되어있던 모든 알림을 제거 (채팅앱 알림은 친구를 차단하거나 하는 등의 다양한 변수가 많기도하고 자주 들어가서 한번 앱 열면 알림 다 없어지도록 처리한듯)
        //잔디: 안 사라짐.
    }

}
