//
//  PomodoroCookieApp.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2020/12/31.
//

import Cocoa
import SwiftUI

@main
struct PomodoroCookieApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    struct Empty: View {
        @State var show = false

        var body: some View {
            if !show {
                EmptyView()
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            Empty()
        }
    }
}
