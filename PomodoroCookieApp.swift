//
//  PomodoroCookieApp.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2020/12/31.
//

import SwiftUI
import Cocoa

@main
struct PomodoroCookieApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            TutorialRoot().environmentObject(AppConfig.shared)
        }
    }
}
