//
//  UserDefaultsPersistentTests.swift
//  PomodoroCookieTests
//
//  Created by 성준영 on 2020/12/31.
//

@testable import PomodoroCookie
import XCTest

class UserDefaultsPersistentTests: XCTestCase {
    func testSetKeySuccess() throws {
        let userDefaultsPersistent = UserDefaultsPersistent()
        let testKey = "testKey"

        userDefaultsPersistent.set(true, forKey: testKey)
        let value = try userDefaultsPersistent.getObject(forKey: testKey) as! Bool

        XCTAssertTrue(value)
    }

    func testSetKeyNotExists() {
        let userDefaultsPersistent = UserDefaultsPersistent()
        let testNotExistsKey = "notExists"

        do {
            _ = try userDefaultsPersistent.getObject(forKey: testNotExistsKey) as! Bool
            XCTFail("value must be not exists")
        } catch {}
    }
}
