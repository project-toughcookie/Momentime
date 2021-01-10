//
//  SettingContextMenu.swift
//  Momentime
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
                    WindowOpener.openSettingWindow()
                }) {
                    Text("Setting".localized)
                }
                Button(action: {
                    print("Temp1 clicked")
                }) {
                    Text("Temp1")
                }
                Divider()
                Button(action: {
                    print("App terminated")
                }) {
                    Text("Exit App".localized)
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
