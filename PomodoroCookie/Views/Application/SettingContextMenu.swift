//
//  SettingContextMenu.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2021/01/02.
//

import SwiftUI

struct SettingContextMenu: View {
    var body: some View {
        MenuButton(
            label: Text("⚙️"),
            content: {
                Button(action: {
                    NSApp.sendAction(#selector(AppDelegate.openSettingWindow), to: nil, from: nil)
                }) {
                    Text("Settings")
                }
                Button(action: {
                    print("Temp1 clicked")
                }) {
                    Text("Temp1")
                }
                Button(action: {
                    print("Temp2 clicked")
                }) {
                    Text("Temp2")
                }
            }
        )
        .menuButtonStyle(BorderlessButtonMenuButtonStyle())
        .frame(width: 20, height: 20, alignment: .center)
    }
}

struct SettingContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        SettingContextMenu()
    }
}
