//
//  SettingManagerTests.swift
//  PomodoroCookieTests
//
//  Created by 성준영 on 2020/12/31.
//

@testable import PomodoroCookie
import XCTest

class SettingManagerTests: XCTestCase {
    func testSetSettingSuccess() {
        let memoryPersistent = MemoryPersistent.shared
        let settingManager = SettingManager(memoryPersistent)
        let testSetting = Setting(eventTitleChangedIfDone: false, timerSoundEnabled: false, timerAutoStarted: false)

        settingManager.setSetting(setting: testSetting)

        XCTAssertEqual(settingManager.setting.eventTitleChangedIfDone, testSetting.eventTitleChangedIfDone)
        XCTAssertEqual(settingManager.setting.timerSoundEnabled, testSetting.timerSoundEnabled)
        XCTAssertEqual(settingManager.setting.timerAutoStarted, testSetting.timerAutoStarted)
    }
}
