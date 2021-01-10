//
//  SettingManagerTests.swift
//  MomentimeTests
//
//  Created by 성준영 on 2021/1/1.
//

@testable import Momentime
import XCTest

class TutorialManagerTests: XCTestCase {
    func testTutorialShownGetSet() {
        let memoryPersistent = MemoryPersistent()
        let tutorialManager = TutorialManager(memoryPersistent)

        XCTAssertFalse(tutorialManager.tutorialShown)
        tutorialManager.tutorialShown = true
        XCTAssertTrue(tutorialManager.tutorialShown)
    }
}
