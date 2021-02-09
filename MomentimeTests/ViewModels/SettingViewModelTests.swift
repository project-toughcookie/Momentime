//
// Created by 성준영 on 2021/01/10.
//

@testable import Momentime
import XCTest

class SettingViewModelTests: XCTestCase {
    func testSettingViewModelInitShouldSucceed() {
        let settingManager = SettingManager(persistent: MemoryPersistent())
        let settingViewModel = SettingViewModel(settingManager: settingManager)
        XCTAssertEqual(settingViewModel.eventTitleChangedIfDone, Setting.default.eventTitleChangedIfDone)
        XCTAssertEqual(settingViewModel.timerAutoStarted, Setting.default.timerAutoStarted)
        XCTAssertEqual(settingViewModel.timerSoundEnabled, Setting.default.timerSoundEnabled)
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
