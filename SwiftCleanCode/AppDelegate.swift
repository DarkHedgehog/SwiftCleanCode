//
//  AppDelegate.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 02.04.2023.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AppAnalythics.shared.configure()
        return true
    }
}
