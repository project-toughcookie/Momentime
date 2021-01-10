//
//  Setting.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/05.
//

import Foundation

final class SettingViewModel: ObservableObject {
    private let settingManager: SettingManager

    @Published var eventTitleChangedIfDone: Bool
    @Published var timerSoundEnabled: Bool
    @Published var timerAutoStarted: Bool

    init(persistent: Persistent = UserDefaultsPersistent()) {
        settingManager = SettingManager(persistent)
        eventTitleChangedIfDone = settingManager.eventTitleChangedIfDone
        timerSoundEnabled = settingManager.timerSoundEnabled
        timerAutoStarted = settingManager.timerAutoStarted
    }

    func set(_ setting: Setting) {
        settingManager.eventTitleChangedIfDone = setting.eventTitleChangedIfDone
        settingManager.timerSoundEnabled = setting.timerSoundEnabled
        settingManager.timerAutoStarted = setting.timerAutoStarted

        eventTitleChangedIfDone = setting.eventTitleChangedIfDone
        timerSoundEnabled = setting.timerSoundEnabled
        timerAutoStarted = setting.timerAutoStarted
    }

    func setEventTitleChangedIfDone(_ eventTitleChangedIfDone: Bool) {
        settingManager.eventTitleChangedIfDone = eventTitleChangedIfDone
        self.eventTitleChangedIfDone = eventTitleChangedIfDone
    }
}