//
//  Setting.swift
//  Momentime
//
//  Created by 성준영 on 2021/01/05.
//

import Foundation

final class SettingViewModel: ObservableObject {
    @Published var eventTitleChangedIfDone: Bool
    @Published var timerSoundEnabled: Bool
    @Published var timerAutoStarted: Bool
    @Published var defaultCalendar: String
    @Published var tutorialShown: Bool
    @Published var playSeconds: Int
    @Published var breakSeconds: Int

    private let settingManager: SettingManager

    init(settingManager: SettingManager = SettingManager()) {
        self.settingManager = settingManager
        eventTitleChangedIfDone = settingManager.eventTitleChangedIfDone
        timerSoundEnabled = settingManager.timerSoundEnabled
        timerAutoStarted = settingManager.timerAutoStarted
        defaultCalendar = settingManager.defaultCalendar
        tutorialShown = settingManager.tutorialShown
        playSeconds = settingManager.playSeconds
        breakSeconds = settingManager.breakSeconds
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
