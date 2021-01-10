//
//  MomentimeApp.swift
//  Momentime
//
//  Created by 성준영 on 2020/12/31.
//

import Cocoa
import SwiftUI

struct modelData {
    static var svm = SettingViewModel()
    static var cvm = CalendarViewModel()
}

var appDelegate = AppDelegate()

@main
enum AppSelector {
    static func main() {
        if #available(OSX 11.0, *) {
            UpToBigSurApp.main()
        } else {
            OldApp.main()
        }
    }
}

@available(OSX 11.0, *)
struct UpToBigSurApp: App {
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

enum OldApp {
    static func main() {
        NSApplication.shared.setActivationPolicy(.regular)
        NSApp.delegate = appDelegate
        NSApp.activate(ignoringOtherApps: true)
        NSApp.run()
    }
}
