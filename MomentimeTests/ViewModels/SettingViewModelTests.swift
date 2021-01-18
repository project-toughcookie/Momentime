//
// Created by 성준영 on 2021/01/10.
//

@testable import Momentime
import XCTest

class SettingViewModelTests: XCTestCase {
    func testSettingViewModelInitAndSet() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let settingViewModel = SettingViewModel(settingManager: settingManager)
        XCTAssertEqual(settingViewModel.eventTitleChangedIfDone, Setting.default.eventTitleChangedIfDone)
        XCTAssertEqual(settingViewModel.timerAutoStarted, Setting.default.timerAutoStarted)
        XCTAssertEqual(settingViewModel.timerSoundEnabled, Setting.default.timerSoundEnabled)

        let mockCalendarId = "mock calendar id"
        settingViewModel.set(Setting(
            eventTitleChangedIfDone: false,
            timerSoundEnabled: false,
            timerAutoStarted: false,
            defaultCalendar: mockCalendarId,
            tutorialShown: false,
            playSeconds: 30,
            breakSeconds: 2
        ))
        XCTAssertEqual(settingViewModel.eventTitleChangedIfDone, false)
        XCTAssertEqual(settingViewModel.timerAutoStarted, false)
        XCTAssertEqual(settingViewModel.timerSoundEnabled, false)
        XCTAssertEqual(settingViewModel.defaultCalendar, mockCalendarId)
        XCTAssertEqual(settingViewModel.tutorialShown, false)
        XCTAssertEqual(settingViewModel.playSeconds, 30)
        XCTAssertEqual(settingViewModel.breakSeconds, 2)
    }

    func testSetDefaultCalendar() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let settingViewModel = SettingViewModel(settingManager: settingManager)
        settingViewModel.setDefaultCalendar("1")
        XCTAssertEqual(settingViewModel.defaultCalendar, "1")
    }

    func testSetEventTitleChangedIfDone() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let settingViewModel = SettingViewModel(settingManager: settingManager)
        settingViewModel.setEventTitleChangedIfDone(false)
        XCTAssertFalse(settingViewModel.eventTitleChangedIfDone)
    }

    func testTutorialShown() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let settingViewModel = SettingViewModel(settingManager: settingManager)
        settingViewModel.setTutorialShown(true)
        XCTAssertTrue(settingViewModel.tutorialShown)
    }
}
