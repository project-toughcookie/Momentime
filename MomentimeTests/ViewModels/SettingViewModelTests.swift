//
// Created by 성준영 on 2021/01/10.
//

@testable import Momentime
import XCTest

class SettingViewModelTests: XCTestCase {
    func testSettingViewModelInitAndSet() {
        let settingViewModel = SettingViewModel(persistent: MemoryPersistent())
        XCTAssertEqual(settingViewModel.eventTitleChangedIfDone, Setting.default.eventTitleChangedIfDone)
        XCTAssertEqual(settingViewModel.timerAutoStarted, Setting.default.timerAutoStarted)
        XCTAssertEqual(settingViewModel.timerSoundEnabled, Setting.default.timerSoundEnabled)

        settingViewModel.set(Setting(eventTitleChangedIfDone: false, timerSoundEnabled: false, timerAutoStarted: false))
        XCTAssertEqual(settingViewModel.eventTitleChangedIfDone, false)
        XCTAssertEqual(settingViewModel.timerAutoStarted, false)
        XCTAssertEqual(settingViewModel.timerSoundEnabled, false)
    }

    func testSetEventTitleChangedIfDone() {
        let settingViewModel = SettingViewModel(persistent: MemoryPersistent())
        settingViewModel.setEventTitleChangedIfDone(false)
        XCTAssertFalse(settingViewModel.eventTitleChangedIfDone)
    }
}
