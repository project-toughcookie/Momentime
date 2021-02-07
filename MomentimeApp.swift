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
    static var pvm = PomodoroViewModal()
}

var appDelegate = AppDelegate()

@main
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
