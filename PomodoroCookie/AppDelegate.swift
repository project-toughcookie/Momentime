//
// Created by 성준영 on 2020/12/31.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        initializePopover()
        initializeStatusBarItem()
    }
    
    private func initializePopover() {
        let rootView = MenuBarRoot().environmentObject(AppConfig.shared)
        
        let popover = NSPopover()
        popover.contentSize = NSSize(width: Constants.MENUBAR_SCREEN_WIDTH, height: Constants.MENUBAR_SCREEN_HEIGHT)
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

