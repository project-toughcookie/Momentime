//
// Created by 성준영 on 2020/12/31.
//

import Foundation

struct Setting: Codable {
    var eventTitleChangedIfDone: Bool
    var timerSoundEnabled: Bool
    var timerAutoStarted: Bool
    var defaultCalendar: String
    var tutorialShown: Bool
    var playSeconds: Int
    var breakSeconds: Int

    static let `default` = Setting(
        eventTitleChangedIfDone: true,
        timerSoundEnabled: true,
        timerAutoStarted: true,
        defaultCalendar: "",
        tutorialShown: false,
        playSeconds: 10,
        breakSeconds: 10
    )
}
