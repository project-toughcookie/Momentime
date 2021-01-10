//
// Created by 성준영 on 2021/01/03.
//

import SwiftUI

class WindowOpener {
    private static var tutorialWindow: NSWindow!
    private static var settingWindow: NSWindow!

    static func openTutorialWindow() {
        if tutorialWindow == nil {
            tutorialWindow = NSWindow(
                contentRect: NSRect(),
                styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                backing: .buffered,
                defer: false
            )
            tutorialWindow.center()
            tutorialWindow.setFrameAutosaveName("Tutorial")
            tutorialWindow.isReleasedWhenClosed = false
            tutorialWindow.contentView = NSHostingView(
                rootView: TutorialView()
                    .environmentObject(modelData.svm)
            )
        }
        NSApplication.shared.activate(ignoringOtherApps: true)
        tutorialWindow.makeKeyAndOrderFront(nil)
    }

    static func openSettingWindow() {
        if settingWindow == nil {
            settingWindow = NSWindow(
                contentRect: NSRect(),
                styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                backing: .buffered,
                defer: false
            )
            settingWindow.center()
            settingWindow.setFrameAutosaveName("Preferences")
            settingWindow.isReleasedWhenClosed = false
            settingWindow.contentView = NSHostingView(
                rootView: SettingView()
                    .environmentObject(modelData.svm)
            )
        }
        NSApplication.shared.activate(ignoringOtherApps: true)
        settingWindow.makeKeyAndOrderFront(nil)
    }
}
