//
//  WindowRootView.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2020/12/31.
//

import SwiftUI

struct SettingPage: View {
    @EnvironmentObject var appConfig: AppConfig
    @ObservedObject var settingManager = SettingManager(persistent: UserDefaultsPersistent())
    
    var body: some View {
        VStack {
            Text("Hello Settings")
            Button(action: { appConfig.settingPageAppeared = false }) {
                Text("Close")
            }
        }
        .frame(width: 400, height: 400, alignment: .center)
        .padding(20)
    }
}

struct SettingPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
            .environmentObject(AppConfig(UserDefaultsPersistent()))
    }
}
