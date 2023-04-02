//
//  AppAnalythics.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 03.04.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics

final class AppAnalythics {
    static let shared = AppAnalythics()

    private init() {
    }

    public func configure() {
        FirebaseApp.configure()
    }

    public func logEvent(_ event: AnalythicEvent) {
        switch event {
        case .login:
            Analytics.logEvent(AnalyticsEventLogin, parameters: [
                AnalyticsParameterMethod: "login"
            ])
        case .loginFailed(let name):
            Analytics.logEvent("loginFailed", parameters: [
                "name": name as NSObject
            ])
        case .logout:
            Analytics.logEvent("logout", parameters: [:])
        case .productListOpened:
            Analytics.logEvent("productListOpened", parameters: [:])
        case .productOpened(let id):
            Analytics.logEvent("productOpened", parameters: [
                "id": id.uuidString as NSObject
            ])
        case .addToCart(let id):
            Analytics.logEvent("addToCart", parameters: [
                "id": id.uuidString as NSObject
            ])
        case .tryAddToCart(let id):
            Analytics.logEvent("tryAddToCart", parameters: [
                "id": id.uuidString as NSObject
            ])
        }
    }

    public enum AnalythicEvent {
        case login
        case loginFailed(String)
        case logout
        case productListOpened
        case productOpened(UUID)
        case addToCart(UUID)
        case tryAddToCart(UUID)
    }
}
