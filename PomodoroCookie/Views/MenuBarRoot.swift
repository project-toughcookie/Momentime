//
//  MenuBarRoot.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2020/12/31.
//

import SwiftUI

struct MenuBarRoot: View {
    @EnvironmentObject var appConfig: AppConfig
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            Button(action: { appConfig.settingPageAppeared = true }) {
                Text("Setting")
            }
            .sheet(isPresented: $appConfig.settingPageAppeared) {
                SettingPage()
            }
        }
        .padding()
        .frame(width: Constants.MENUBAR_SCREEN_WIDTH,
               height: Constants.MENUBAR_SCREEN_HEIGHT,
               alignment: .leading)
    }
}

struct MenuBarRoot_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarRoot()
            .environmentObject(AppConfig(UserDefaultsPersistent()))
    }
}
