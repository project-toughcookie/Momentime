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
    @Published var defaultCalendar: String
    @Published var tutorialShown: Bool

    init(persistent: Persistent = UserDefaultsPersistent()) {
        settingManager = SettingManager(persistent: persistent)
        eventTitleChangedIfDone = settingManager.eventTitleChangedIfDone
        timerSoundEnabled = settingManager.timerSoundEnabled
        timerAutoStarted = settingManager.timerAutoStarted
        defaultCalendar = settingManager.defaultCalendar
        tutorialShown = settingManager.tutorialShown
    }

    func set(_ setting: Setting) {
        settingManager.eventTitleChangedIfDone = setting.eventTitleChangedIfDone
        settingManager.timerSoundEnabled = setting.timerSoundEnabled
        settingManager.timerAutoStarted = setting.timerAutoStarted
        settingManager.defaultCalendar = setting.defaultCalendar
        settingManager.tutorialShown = setting.tutorialShown

        eventTitleChangedIfDone = setting.eventTitleChangedIfDone
        timerSoundEnabled = setting.timerSoundEnabled
        timerAutoStarted = setting.timerAutoStarted
        defaultCalendar = setting.defaultCalendar
        tutorialShown = setting.tutorialShown
    }

    func setDefaultCalendar(_ defaultCalendar: String) {
        settingManager.defaultCalendar = defaultCalendar
        self.defaultCalendar = defaultCalendar
    }

    func setEventTitleChangedIfDone(_ eventTitleChangedIfDone: Bool) {
        settingManager.eventTitleChangedIfDone = eventTitleChangedIfDone
        self.eventTitleChangedIfDone = eventTitleChangedIfDone
    }

    func setTutorialShown(_ tutorialShown: Bool) {
        settingManager.tutorialShown = tutorialShown
        self.tutorialShown = tutorialShown
    }
}
