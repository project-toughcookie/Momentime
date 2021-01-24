//
//  WindowRootView.swift
//  Momentime
//
//  Created by 성준영 on 2020/12/31.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var svm: SettingViewModel

    var body: some View {
        VStack {
            Text("Event title changed if on: \(String(svm.eventTitleChangedIfDone))")
            Text("Timer sound enabled: \(String(svm.timerSoundEnabled))")
            Text("Timer auto started: \(String(svm.timerAutoStarted))")
                .onHover(perform: { _ in
                    print("hovering")
                    svm.setEventTitleChangedIfDone(false)
                })
        }
        .frame(width: Constants.SETTING_WIDTH,
               height: Constants.SETTING_HEIGHT,
               alignment: .center)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        let settingManager = SettingManager(persistent: MemoryPersistent())

        SettingView()
            .environmentObject(SettingViewModel(settingManager: settingManager))
    }
}
