//
//  SettingManagerTests.swift
//  PomodoroCookieTests
//
//  Created by 성준영 on 2021/1/1.
//

@testable import PomodoroCookie
import XCTest

class TutorialManagerTests: XCTestCase {
    func testSetTutorialToShownSuccess() {
        let memoryPersistent = MemoryPersistent.shared
        let tutorialManager = TutorialManager(memoryPersistent)

        tutorialManager.SetTutorialToShown()

        XCTAssertEqual(tutorialManager.tutorialShown, true)
    }
}
