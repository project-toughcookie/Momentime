//
// Created by 성준영 on 2020/12/31.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_: Notification) {
        initializePopover()
        initializeStatusBarItem()
    }

    private func initializePopover() {
        let rootView = ContentView()
            .environmentObject(modelData.svm)
            .environmentObject(modelData.cvm)
        if !modelData.svm.tutorialShown {
            WindowOpener.openTutorialWindow()
        }

        let popover = NSPopover()
        popover.contentSize.width = Constants.MENUBAR_VIEW_WIDTH
        popover.contentSize.height = Constants.MENUBAR_VIEW_HEIGHT
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: rootView)
        self.popover = popover
    }

    private func initializeStatusBarItem() {
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        if let button = statusBarItem.button {
            button.image = NSImage(named: "MenuBarIcon")
            button.action = #selector(togglePopover(_:))
        }
    }

    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusBarItem.button {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
