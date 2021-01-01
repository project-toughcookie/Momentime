//
//  WindowRootView.swift
//  PomodoroCookie
//
//  Created by 성준영 on 2020/12/31.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var settingManager = SettingManager(UserDefaultsPersistent())

    var body: some View {
        VStack {
            Text("Event title changed if on: \(String(settingManager.setting.eventTitleChangedIfDone))")
            Text("Timer sound enabled: \(String(settingManager.setting.timerSoundEnabled))")
            Text("Timer auto started: \(String(settingManager.setting.eventTitleChangedIfDone))")
        }
        .frame(width: Constants.SETTING_VIEW_WIDTH,
               height: Constants.SETTING_VIEW_HEIGHT,
               alignment: .center)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
