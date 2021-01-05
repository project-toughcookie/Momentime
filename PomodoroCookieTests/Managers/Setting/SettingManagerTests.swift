//
//  SettingManagerTests.swift
//  PomodoroCookieTests
//
//  Created by 성준영 on 2020/12/31.
//

@testable import PomodoroCookie
import XCTest

class SettingManagerTests: XCTestCase {
    func testEventTitleChangedIfDoneGetSet() {
        let memoryPersistent = MemoryPersistent()
        let settingManager = SettingManager(memoryPersistent)

        XCTAssertTrue(settingManager.eventTitleChangedIfDone)
        settingManager.eventTitleChangedIfDone = false
        XCTAssertFalse(settingManager.eventTitleChangedIfDone)
    }

    func testTimerSoundEnabledGetSet() {
        let memoryPersistent = MemoryPersistent()
        let settingManager = SettingManager(memoryPersistent)

        XCTAssertTrue(settingManager.timerSoundEnabled)
        settingManager.timerSoundEnabled = false
        XCTAssertFalse(settingManager.timerSoundEnabled)
    }

    func testTimerAutoStartedGetSet() {
        let memoryPersistent = MemoryPersistent()
        let settingManager = SettingManager(memoryPersistent)

        XCTAssertTrue(settingManager.timerAutoStarted)
        settingManager.timerAutoStarted = false
        XCTAssertFalse(settingManager.timerAutoStarted)
    }
}
